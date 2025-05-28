import 'package:flutter/material.dart';

enum PetGenero { macho, femea }

class PerfilPetScreen extends StatefulWidget {
  const PerfilPetScreen({super.key});

  @override
  State<PerfilPetScreen> createState() => _PerfilPetScreenState();
}

class _PerfilPetScreenState extends State<PerfilPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final animalController = TextEditingController();
  final racaController = TextEditingController();
  final idadeController = TextEditingController();
  final observacoesController = TextEditingController();

  PetGenero? _generoSelecionado;
  bool _gostaCriancas = false;
  bool _conviveOutrosAnimais = false;
  bool _disponivelParaAdocao = false;

  void _limparCampos() {
    nomeController.clear();
    animalController.clear();
    racaController.clear();
    idadeController.clear();
    observacoesController.clear();
    setState(() {
      _generoSelecionado = null;
      _gostaCriancas = false;
      _conviveOutrosAnimais = false;
      _disponivelParaAdocao = false;
    });
  }

  void _salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('🐶 Dados do pet salvos com sucesso!')),
      );
    }
  }

  OutlineInputBorder _bordasArredondadas() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: const Text('🐾 PetPerfil'),
        backgroundColor: const Color.fromARGB(255, 121, 178, 242),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Perfil do Tutor',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('🔐 Acessando perfil do tutor...'),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "🐾 Cadastro do Pet",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Complete os dados para cadastrar seu amiguinho!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: const Icon(Icons.pets),
                  border: _bordasArredondadas(),
                  focusedBorder: _bordasArredondadas(),
                  enabledBorder: _bordasArredondadas(),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome do seu Pet';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: animalController,
                decoration: InputDecoration(
                  labelText: 'Tipo de animal',
                  border: _bordasArredondadas(),
                  focusedBorder: _bordasArredondadas(),
                  enabledBorder: _bordasArredondadas(),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o tipo de animal';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: racaController,
                decoration: InputDecoration(
                  labelText: 'Raça',
                  border: _bordasArredondadas(),
                  focusedBorder: _bordasArredondadas(),
                  enabledBorder: _bordasArredondadas(),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a Raça';
                  }
                  return null;
                }
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: idadeController,
                decoration: InputDecoration(
                  labelText: 'Idade (anos)',
                  border: _bordasArredondadas(),
                  focusedBorder: _bordasArredondadas(),
                  enabledBorder: _bordasArredondadas(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final idade = int.tryParse(value ?? '');
                  if (idade == null || idade < 0) {
                    return 'Informe uma idade válida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: observacoesController,
                decoration: InputDecoration(
                  labelText: 'Observações',
                  border: _bordasArredondadas(),
                  focusedBorder: _bordasArredondadas(),
                  enabledBorder: _bordasArredondadas(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              const Text('Gênero'),
              RadioListTile<PetGenero>(
                title: const Text('Macho'),
                value: PetGenero.macho,
                groupValue: _generoSelecionado,
                onChanged:
                    (value) => setState(() => _generoSelecionado = value),
              ),
              RadioListTile<PetGenero>(
                title: const Text('Fêmea'),
                value: PetGenero.femea,
                groupValue: _generoSelecionado,
                onChanged:
                    (value) => setState(() => _generoSelecionado = value),
              ),
              const SizedBox(height: 16),
              const Text('Preferências de Convivência'),
              CheckboxListTile(
                title: const Text('Gosta de crianças'),
                value: _gostaCriancas,
                onChanged:
                    (value) => setState(() => _gostaCriancas = value ?? false),
              ),
              CheckboxListTile(
                title: const Text('Convive bem com outros animais'),
                value: _conviveOutrosAnimais,
                onChanged:
                    (value) =>
                        setState(() => _conviveOutrosAnimais = value ?? false),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Disponível para adoção'),
                value: _disponivelParaAdocao,
                onChanged:
                    (value) => setState(() => _disponivelParaAdocao = value),
              ),
              Text(
                _disponivelParaAdocao
                    ? '📢 Status: Disponível'
                    : '📪 Status: Indisponível',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: _salvarFormulario,
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _limparCampos,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Limpar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
