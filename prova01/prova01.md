# Equipe
- Carolyne Fernanda Martyres
- Mateus Henrique Lima
- Matheus Henrique Miranda Lós

## 1. Column

**Descrição**:  
Componente que organiza widgets verticalmente, de cima para baixo.

**Aplicações**:  
Ideal para estruturar telas em blocos verticais, como cabeçalhos, seções e rodapés.

**Como usar**:
```dart
Column(
  children: [
    Text('Topo'),
    Container(height: 100),
    Text('Rodapé'),
  ],
)
````
## 2. Row

**Descrição**:
Organiza widgets horizontalmente em uma única linha.

**Aplicações**:
Útil para criar barras superiores, colocar textos e botões lado a lado, como nome do usuário + botão "Seguir".

**Como Utilizar**:
````dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text('Usuário'),
    TextButton(onPressed: () {}, child: Text('Seguir')),
  ],
)
````

## 3. SingleChildScrollView com scrollDirection: Axis.horizontal

**Descrição**:  
Permite rolagem lateral de um único filho.

**Aplicações**:  
Barras de stories, carrosséis de imagens ou ícones.

**Como usar**:
```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [Widget1(), Widget2(), Widget3()],
  ),
)
````

## 4. Expanded

**Descrição**:  
Expande um widget filho para ocupar o espaço restante.

**Aplicações**:  
Usado para preencher a tela com uma lista ou outro widget.

**Como usar**:
```dart
Expanded(
  child: ListView(children: [/* conteúdo */]),
)
````

## 5. Stack com Positioned

**Descrição**:  
Empilha widgets e permite posicioná-los sobrepostos.

**Aplicações**:  
Usado para colocar um ícone (como play) sobre uma imagem.

**Como usar**:
```dart
Stack(
  children: [
    Image.asset('img.jpg'),
    Positioned(top: 8, right: 8, child: Icon(Icons.play_circle)),
  ],
)
````

## 6. Wrap

**Descrição**:  
Organiza widgets em várias linhas quando o espaço acabar.

**Aplicações**:  
Exibir hashtags, botões, chips com quebra de linha automática

**Como usar**:
```dart
Wrap(
  spacing: 6,
  children: [
    Chip(label: Text('#Flutter')),
    Chip(label: Text('#Dart')),
  ],
)
````

## 7. Padding

**Descrição**:  
Adiciona espaço interno ao redor do widget.

**Aplicações**:  
Separar visualmente elementos para melhor legibilidade.

**Como usar**:
```dart
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Texto com espaço'),
)
````

## 8. SizedBox

**Descrição**:  
Espaço fixo entre widgets.

**Aplicações**:  
Controlar altura ou largura entre componentes.

**Como usar**:
```dart
SizedBox(height: 12)
````

## 9. Align

**Descrição**:  
Alinha um widget em uma posição específica dentro de seu espaço.

**Aplicações**:  
Alinhar elementos sem usar Row ou Column.

**Como usar**:
```dart
Align(
  alignment: Alignment.centerRight,
  child: Text('Texto alinhado'),
)
````

## 10. Container

**Descrição**:  
Caixa genérica usada para estilizar, colorir e agrupar widgets.

**Aplicações**:  
Blocos visuais, cartões, molduras.

**Como usar**:
```dart
Container(
  padding: EdgeInsets.all(8),
  color: Colors.grey[200],
  child: Text('Conteúdo'),
)
````

## 11. ListView.builder

**Descrição**:  
Widget que cria listas de forma dinâmica e eficiente.

**Aplicações**:  
Exibir listas com muitos itens, como destinos de viagem.

**Como usar**:
```dart
ListView.builder(
  itemCount: destinos.length,
  itemBuilder: (context, index) {
    return Text(destinos[index]);
  },
)
````

## 12. Card

**Descrição**:  
Componente visual com borda, sombra e padding.

**Aplicações**:  
Blocos de conteúdo como cartões de destinos.

**Como usar**:
```dart
Card(
  elevation: 4,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  child: Padding(
    padding: EdgeInsets.all(8),
    child: Text('Conteúdo do card'),
  ),
)
````

## 13. IconButton

**Descrição**:  
Botão com ícone clicável.

**Aplicações**:  
Favoritar, compartilhar ou executar ações rápidas.

**Como usar**:
```dart
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {
    // ação ao clicar
  },
)
````

## 14. Hero

**Descrição**:  
Animação suave entre widgets em diferentes telas com o mesmo tag.

**Aplicações**:  
Transição de imagem entre a tela principal e a tela de detalhes.

**Como usar**:
```dart
Hero(
  tag: 'imagem1',
  child: Image.asset('img.jpg'),
)
````

## 15. ClipRRect

**Descrição**:  
Permite aplicar bordas arredondadas a widgets, como imagens.

**Aplicações**:  
Estilizar imagens em cards com cantos arredondados.

**Como usar**:
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Image.asset('img.jpg'),
)
````

## 16. Scaffold

**Descrição**:  
Estrutura básica da tela com appBar, body e outros elementos.

**Aplicações**:  
Criar telas completas com layout padrão do Flutter.

**Como usar**:
```dart
Scaffold(
  appBar: AppBar(title: Text('Título')),
  body: Text('Conteúdo'),
)
````

## 17. AppBar

**Descrição**:  
Barra superior da tela com título e ações.

**Aplicações**:  
Identificação da tela e navegação.

**Como usar**:
```dart
AppBar(
  title: Text('Catálogo'),
)
````

## 18. Navigator + MaterialPageRoute

**Descrição**:  
Gerencia a navegação entre telas.

**Aplicações**:  
Levar o usuário da lista de destinos para a tela de detalhes.

**Como usar**:
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => OutraTela()),
);
````

## 19. TextField

**Descrição**:  
Campo de entrada de texto do usuário.

**Aplicações**:  
Coletar informações como peso e altura.

**Como usar**:
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Peso',
    border: OutlineInputBorder(),
  ),
)
````

## 20. ElevatedButton.icon

**Descrição**:  
Botão com ícone e rótulo, elevado com estilo customizável.

**Aplicações**:  
Ação de cálculo, destaque de comandos principais.

**Como usar**:
```dart
ElevatedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.favorite),
  label: Text('Calcular'),
)
````

## 21. Text

**Descrição**:  
Exibe informações em texto simples ou estilizado.

**Aplicações**:  
Mostrar o resultado do IMC e sua classificação.

**Como usar**:
```dart
Text(
  'Seu IMC é: 24.5',
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
)
````

## 22. Image.network

**Descrição**:  
Carrega e exibe imagens diretamente de URLs externas.

**Aplicações**:  
Mostrar ícones ilustrativos online.

**Como usar**:
```dart
Image.network(
  'https://exemplo.com/imagem.png',
  height: 80,
)
````
