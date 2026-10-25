`timescale 1ns / 1ps

// Testbench dla zmodyfikowanego modulu cpu (scs_src_2024/cpu_src/src/cpu.v).
// Pamiec modeluje port A bloku BRAM z projektu: 16 x 8 bit, zapis/odczyt
// synchroniczny na zboczu ~clk_cpu, tryb Write First (jak w toplevel.v).
// Po kazdym takcie zegara wypisywana jest linia w formacie modulu dbgu.

module cpu_tb;

reg clk = 0;
reg reset_n = 0;

wire [3:0] mem_address;
reg  [7:0] mem_data_r;
wire [7:0] mem_data_w;
wire mem_we;

wire [1:0] dbg_state;
wire [3:0] dbg_r0;
wire [3:0] dbg_r1;
wire [3:0] dbg_pc;

reg [7:0] mem [0:15];
integer i;
integer cycles;

cpu cpu1(
	.clk(clk),
	.reset_n(reset_n),
	.mem_address(mem_address),
	.mem_data_r(mem_data_r),
	.mem_data_w(mem_data_w),
	.mem_we(mem_we),
	.dbg_state(dbg_state),
	.dbg_r0(dbg_r0),
	.dbg_r1(dbg_r1),
	.dbg_pc(dbg_pc)
);

//port A pamieci taktowany zanegowanym zegarem CPU
always @(negedge clk)
begin
	if(mem_we)
	begin
		mem[mem_address] <= mem_data_w;
		mem_data_r <= mem_data_w;		//Write First
	end
	else
		mem_data_r <= mem[mem_address];
end

task dump;
begin
	$write("c=%0h r0=%0h r1=%0h pc=%0h A=%0h R=%02h W=%02h M:",
		dbg_state, dbg_r0, dbg_r1, dbg_pc, mem_address, mem_data_r, mem_data_w);
	for(i = 0; i < 16; i = i + 1)
		$write(" %02h", mem[i]);
	$write("\n");
end
endtask

//po konfiguracji FPGA wszystkie przerzutniki maja wartosc 0,
//a reset_n w cpu.v nie zeruje rejestrow mem_data_w, mem_address i opcode
initial
begin
	cpu1.mem_data_w = 0;
	cpu1.mem_address = 0;
	cpu1.opcode = 0;
end

reg [8*64-1:0] program_file;

initial
begin
	if(!$value$plusargs("cycles=%d", cycles))
		cycles = 36;
	if(!$value$plusargs("program=%s", program_file))
		program_file = "program.mem";
	$readmemh(program_file, mem);
	mem_data_r = 0;

	#10 reset_n = 1;
	repeat(cycles)
	begin
		#10 clk = 1;
		#1 dump;
		#9 clk = 0;
	end
	$finish;
end

endmodule
