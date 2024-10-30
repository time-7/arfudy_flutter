# arfudy_flutter

Projeto desenvolvido pelo time 7 da matéria de Fabrica de Software 2022.2 da UTFPR.

Estre porjeto foi retomado na matéria de Fábrica de Software no semetre de 2023.2 pelo time 8.

Este projeto tem o objetivo de visualização de cardápio, realização de pedidos e 
atendimento em restaurantes que utilizem a ARfudy,
através de aplicativo mobile multi-plataforma

Foi utilizado a lib flutter_unity_widget para implementar a Feature de realidade aumentada (AR) no qual os pratos do cardápio são representados em 3D. Para o build definitivo com a Feature habilitada é necessário descomentar as linhas de códigos relativas a funcionalidade. Buildar o projeto Unity de acordo com a documentação da biblioteca e em seguida rodar o projeto Flutter normalmente.

### Características
```
Iniciar atendimento com leitura de QR code da mesa
Geração dos QR codes das mesas
Visualização do cardápio
Visualização da tabela nutricional de cada item do cardápio
Realização de pedidos
Visualização da situação da mesa
Encerramento de atendimento
```

### Tecnologia
[Flutter framework](https://flutter.dev/) <br>
[GetX - gerenciamento de estado, injeção de dependência e gerenciamento de rotas](https://pub.dev/packages/get)<br>
[Modular - injeção de dependênicas em módulos](https://pub.dev/packages/flutter_modular)<br>
[Unity](https://unity.com/pt)<br>
[Flutter Unity Widget](https://pub.dev/packages/flutter_unity_widget)<br>

### Como usar
Passo 1: instale o SDK do Flutter 
```
https://docs.flutter.dev/get-started/install
```

Passo 2: clone o repositório
```
git clone https://github.com/time-7/arfudy_flutter.git
```
Passo 3: Na raiz do projeto execute o comando no console para obter as dependências necessárias
```
flutter pub get
```
Passo 4: Na raiz do projeto execute o comando no console para rodar o app
```
flutter run
```

### Autores 2022.2
[Eduardo Nonemacher](https://github.com/ernonemacher)<br>
[Felippe Negrão](https://github.com/FelippeNO)<br>
[Pedro Andreis](https://github.com/pedroandreis)

### Autores 2023.2
[Felippe Negrão](https://github.com/FelippeNO)<br>
[Julia Stahl](https://github.com/JuliaMStahl)
