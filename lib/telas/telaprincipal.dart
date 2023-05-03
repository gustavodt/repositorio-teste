import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:revisao_p_prova/componentes/botao.dart';
import 'package:revisao_p_prova/componentes/caixa_texto.dart';

import 'package:http/http.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final _txtCep = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _cidade = 'Cidade XXXXX';
  String _data = 'Data: XXXXX';
  String _hora = 'Hora: XXXXX';
  String _temperatura = 'Temperatura: XXXXX';
  String _descricao = 'Descrição: XXXXX';

  @override
  Widget build(BuildContext context) {
    buscaEndereco() async {
      final String urlViaCep = 'https://viacep.com.br/ws/${_txtCep.text}/json/';
      Response resposta = await get(Uri.parse(urlViaCep));
      Map enderecoClima = json.decode(resposta.body);
      
      final String urlHgWeather =
          'https://api.hgbrasil.com/weather?key=24a4d8aa&city_name=${enderecoClima['localicade']}';

      setState(() {
        _cidade = 'Cidade: ${enderecoClima['localidade']}';
      });
    }

    criaAppBar() {
      return AppBar(
        title: const Text('Clima Tempo'),
        titleTextStyle: const TextStyle(color: Colors.amber, fontSize: 20),
        backgroundColor: const Color.fromARGB(255, 120, 2, 255),
        centerTitle: true,
      );
    }

    criaBody() {
      return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: CaixaDeTexto(
                    controlador: _txtCep,
                    msgValidacao: 'Informe CEP',
                    texto: 'CEP',
                  )),
                  Botao(
                    funcao: buscaEndereco,
                    texto: 'Pesquisar',
                  ),
                ],
              ),
              Text(
                _cidade,
                style: const TextStyle(fontSize: 19),
              ),
              Text(
                _data,
                style: const TextStyle(fontSize: 19),
              ),
              Text(
                _hora,
                style: const TextStyle(fontSize: 19),
              ),
              Text(
                _temperatura,
                style: const TextStyle(fontSize: 19),
              ),
              Text(
                _descricao,
                style: const TextStyle(fontSize: 19),
              ),
            ],
          ));
    }

    return Scaffold(
      appBar: criaAppBar(),
      body: criaBody(),
    );
  }
}
