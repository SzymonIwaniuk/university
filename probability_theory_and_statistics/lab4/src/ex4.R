# Zadanie 4
# 10 żarówkek z czego 3 są wadliwe więc 7 jest sprawnych
# z których wybieramy 2 więc
# Moc zbioru Ω: |Ω| = C(10,2)
# Moc zdarzenia A (obie sprawne): |A| = C(7,2)
# P(A) = |A|/|Ω|
p <- choose(7, 2) / choose(10, 2)
p
