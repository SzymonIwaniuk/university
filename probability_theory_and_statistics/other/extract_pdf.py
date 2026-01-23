from pypdf import PdfReader

reader = PdfReader("/Users/szymon/Downloads/materiały2/Lab8_Analiza_korelacyjna_regresje_st.pdf")
for page in reader.pages:
    print(page.extract_text())
