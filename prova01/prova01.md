#Equipe
- Carolyne Fernanda Martyres
- Mateus Henrique Lima
- Matheus Henrique Miranda Lós

## 1 - Column

**Descrição**:
Componente que organiza widgets verticalmente, de cima para baixo.

**Aplicações**:
Ideal para estruturar telas em blocos verticais, como cabeçalhos, seções e rodapés.

**Como usar**:
Column(
  children: [
    Text('Topo'),
    Container(height: 100),
    Text('Rodapé'),
  ],
)

## 2 - Row

**Descrição**:
Organiza widgets horizontalmente em uma única linha.

**Aplicações**:
Útil para criar barras superiores, colocar textos e botões lado a lado, como nome do usuário + botão "Seguir".

**Como Utilizar**:
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Usuário'),
    TextButton(onPressed: () {}, child: Text('Seguir')),
  ],
)
