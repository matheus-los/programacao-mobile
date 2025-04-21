//Catálogo de Viagens

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CatalogoViagensApp());
}

class CatalogoViagensApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Viagens',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,  
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.robotoSlabTextTheme(
          ThemeData.dark().textTheme,
        ).copyWith(
          bodyLarge: TextStyle(color: Colors.white),  
          bodyMedium: TextStyle(color: Colors.white),  
          titleLarge: TextStyle(color: Colors.white),  
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white), 
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> destinos = [
    {
      'titulo': 'Praia do Rosa',
      'descricao': 'Santa Catarina - Natureza e surf.',
      'imagem': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/d7/f2/b8/dsc-1312a-largejpg.jpg?w=900&h=-1&s=1',
      'avaliacao': 4.5,
      'favorito': false,
      'textoDetalhado': 'A Praia do Rosa, em Santa Catarina, é apresentada como um paraíso que une natureza exuberante e tranquilidade. O texto destaca suas praias ideais para surf, trilhas com vistas panorâmicas e a observação de baleias francas no inverno. A vila charmosa oferece pousadas, restaurantes e lojas, com uma vida noturna vibrante. As atividades sugeridas incluem relaxar nas praias, surfar, explorar a natureza, observar baleias, saborear a gastronomia local e aproveitar a vida noturna. A Praia do Rosa é descrita como uma experiência transformadora para quem busca paz, aventura e beleza natural.'
    },
    {
      'titulo': 'Chapada dos Veadeiros',
      'descricao': 'Goiás - Cachoeiras e trilhas incríveis.',
      'imagem': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/12/d4/15/ee/lugar-lindo.jpg?w=1200&h=-1&s=1',
      'avaliacao': 4.8,
      'favorito': false,
      'textoDetalhado': 'A Chapada dos Veadeiros, localizada em Goiás, é um dos destinos mais visitados do Brasil por sua beleza natural exuberante. O local é famoso pelas suas cachoeiras, trilhas e formações rochosas. As águas cristalinas e as paisagens deslumbrantes oferecem uma experiência única para os amantes da natureza e do ecoturismo. As atividades incluem caminhadas pelas trilhas, banhos de cachoeira e observação da fauna e flora local.'
    },
    {
      'titulo': 'Fernando de Noronha',
      'descricao': 'Pernambuco - Paraíso ecológico.',
      'imagem': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/34/01/06/fernando-de-noronha.jpg?w=1400&h=1400&s=1',
      'avaliacao': 4.9,
      'favorito': false,
      'textoDetalhado': 'Fernando de Noronha é um arquipélago localizado em Pernambuco, conhecido por suas águas cristalinas, vida marinha rica e paisagens paradisíacas. O destino é perfeito para quem gosta de mergulho, observação de golfinhos e relaxamento em praias isoladas. Além disso, a ilha oferece uma experiência ecológica única, com atividades de preservação e respeito ao meio ambiente.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Viagens'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: destinos.length,
        itemBuilder: (context, index) {
          final destino = destinos[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            color: Colors.grey[800], 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalhesDestino(destino: destino),
                      ),
                    );
                  },
                  child: Hero(
                    tag: destino['titulo'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(destino['imagem']),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            destino['titulo'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Icon(Icons.travel_explore, color: Colors.tealAccent), 
                        ],
                      ),
                      const SizedBox(height: 8),

                      Text(
                        destino['descricao'],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          ...List.generate(5, (i) {
                            return Icon(
                              i < destino['avaliacao'].floor()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                          SizedBox(width: 8),
                          Text(
                            destino['avaliacao'].toString(),
                            style: TextStyle(color: Colors.amberAccent),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              destino['favorito']
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.pinkAccent,
                            ),
                            tooltip: 'Favoritar',
                            onPressed: () {
                              destino['favorito'] = !destino['favorito'];
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.share, color: Colors.blueAccent),
                            tooltip: 'Compartilhar',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Link de ${destino['titulo']} compartilhado!'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DetalhesDestino extends StatelessWidget {
  final Map<String, dynamic> destino;

  const DetalhesDestino({required this.destino});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destino['titulo']),
        leading: BackButton(),
      ),
      body: ListView(
        children: [
          Hero(
            tag: destino['titulo'], 
            child: Image.network(
              destino['imagem'],
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  destino['titulo'],
                  style: GoogleFonts.robotoSlab(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, 
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    ...List.generate(5, (i) {
                      return Icon(
                        i < destino['avaliacao'].floor()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      );
                    }),
                    const SizedBox(width: 8),
                    Text(
                      destino['avaliacao'].toString(),
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Text(
                  destino['textoDetalhado'], 
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 
