library(torch)
# Exercício 1: Explorando Dimensões de Tensores
# Considere um tensor criado com torch_tensor(1:12).
# Qual seria a dimensão desse tensor?
t <-  torch_tensor(1:12)
print(t)
dim(t)
# Exercício 2: Operações Básicas
# Dados dois tensores A e B, ambos com valores torch_tensor(1:4),
# qual seria o resultado de A * B?
A <- torch_tensor(1:4)
B <- torch_tensor(1:4)
A * B
# Exercício 3: Desafio de Redimensionamento
# Se você tiver um tensor de 12 elementos,
# quais dimensões você poderia usar para redimensioná-lo em
# uma matriz 2D sem causar erro? Mostre como você faria isso.
t2 <- torch_tensor(1:12)
dim(t2)
t2_matrix <- t2$view(c(4, 3))
print(t2_matrix)

# Exercício 4: Slicing Avançado
# Considere um tensor 3D com dimensões (4, 4, 4).
# Como você acessaria apenas a segunda e terceira coluna da segunda "página"?
# Experimente várias formas de fazer isso.
t3 <- torch_tensor(array(1:87, dim = c(4, 4, 4)))
print(t3)
t3[2, , 2:3]
# Exercício 5: Broadcasting
# Dados tensor_a5 de dimensão (3, 2) e tensor_b5 de dimensão (2,),
# qual seria o resultado de tensor_a5 + tensor_b5? E se tentássemos somar
# tensor_a5 com um tensor de dimensão (3,), isso causaria um erro?
tensor_a5 <- torch_tensor(array(1:6, dim = c(3, 2)))
tensor_b5 <- torch_tensor(1:2)
tensor_a5 + tensor_b5
tensor_c5 <- torch_tensor(1:3)
tensor_a5 + tensor_c5 # Gera a exceção : Error in (function (self, other, alpha)  :
# The size of tensor a (2) must match the size of tensor b (3) at non-singleton dimension 1


# Exercício 6: Interpretando Resultados de Operações Matriciais
# Se você multiplicar um tensor A (dimensão 2x3) por um tensor B (dimensão 3x2),
# qual será a dimensão do resultado? Qual seria a dimensão se você transpuser
# o resultado?
A6 <- torch_tensor(array(1:6, dim = c(2, 3)))
B6 <- torch_tensor(array(1:6, dim = c(3, 2)))
C6 <- torch_matmul(A6, B6)
A6
B6
C6
# Exercício 7: Manipulação de Datasets com Tensores
# Após converter o dataset 'mtcars' para um tensor, que passos você
# tomaria para calcular a média da primeira coluna (mpg)? Escreva o código.
mtcars_tensor <- torch_tensor(as.matrix(scale(mtcars)))
mtcars_tensor
mean(mtcars_tensor[, 1])
# Exercício 8: Predição de Decomposição de Matrizes
# Ao realizar uma decomposição QR em um tensor quadrado 4x4,
# quantas matrizes e de quais dimensões você espera receber?
t8 <- torch_tensor(array(1:16, dim = c(4, 4)))
t8 <- t8$to(dtype = torch_float()) # Aceita float ou complex
t8_qr <- torch_qr(t8)
t8_qr
# Exercício 9: Desafio Prático - Regressão Linear
# Dado o dataset 'cars', com duas colunas (x e y), como você utilizaria
# tensores para calcular os coeficientes de uma regressão linear de y em x?
# Dica: Considere a fórmula da regressão linear (β = (X'X)^-1 X'y).
# Calcule todas as formas que você conhece para fazer isso e
# compare os resultados.
cars <- mtcars
cars_tensor <- torch_tensor(as.matrix(scale(cars)))
X <- cars_tensor[, 2:-1]
y <- cars_tensor[, 1]


torch_matmul(X$t(), X)$inverse() |>
  torch_matmul(X$t()) |>
  torch_matmul(y)

