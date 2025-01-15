<div align="center">

# 🧠 PSIBem 🧠

</div>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302568D?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-%230175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/VSCode-%23007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white" />
  <img src="https://img.shields.io/badge/Android-%233DDC84?style=for-the-badge&logo=android&logoColor=white" />
  <img src="https://img.shields.io/badge/iOS-%2315B6A2?style=for-the-badge&logo=apple&logoColor=white" />
</p>

 O **PSIBem** é um aplicativo em desenvolvimento voltado para a saúde mental, que proporciona funcionalidades para rastreamento de humor, meditação, mindfulness e acompanhamento por profissionais de saúde.

<p align="center"><img src="http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge"/></p>

## 🚀 Funcionalidades

- 🔐 **Cadastro e Login**: Autenticação segura de pacientes e profissionais.
- 📅 **Calendário de Humor**: Registro e acompanhamento do humor ao longo do tempo.
- 🧘‍♂️ **Exercícios de Mindfulness**: Acesso a práticas de respiração e meditação.
- 📊 **Relatórios de Humor**: Geração de relatórios e gráficos de humor semanal/mensal.
- 🔄 **Compartilhamento de Dados**: Compartilhamento de relatórios com profissionais de saúde.

## 🛠 Tecnologias Utilizadas

- **Flutter**: Framework principal para o desenvolvimento multiplataforma.
- **Dart**: Linguagem de programação usada no desenvolvimento do aplicativo.
- **Firebase**: Para autenticação e armazenamento em tempo real.
- **SQLite**: Banco de dados local com dados criptografados.
- **VSCode**: Editor de código utilizado para desenvolvimento.

## ✅ Pré-requisitos

Para executar este projeto, você precisa ter os seguintes pré-requisitos:

- **Flutter SDK**: Certifique-se de ter o [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado em sua máquina.
- **Android Studio ou Xcode**: Para emular dispositivos Android ou iOS.
- **Conta Firebase**: Para usar autenticação e banco de dados em tempo real (configuração opcional por enquanto).

## ▶️ Como Executar o Projeto

1. Clone o repositório para o seu ambiente local:
    ```bash
    git clone https://github.com/JennieOliveira99/PSIBem.git
    ```

2. Navegue até a pasta do projeto:
    ```bash
    cd PSIBem
    ```

3. Instale as dependências do Flutter:
    ```bash
    flutter pub get
    ```

4. Para rodar o aplicativo em um emulador ou dispositivo físico, use o comando:
    ```bash
    flutter run
    ```

## 📂 Estrutura do Código

A pasta `lib` contém os arquivos principais do código Flutter, organizados seguindo o padrão **MVC** (Model-View-Controller) para garantir uma estrutura clara, modular e de fácil manutenção.
- **main.dart**: Arquivo de entrada do aplicativo, responsável por inicializar o app, configurar o tema e definir as rotas de navegação entre as telas.
- **models/**: Contém as classes responsáveis pelos dados e lógica de negócios do aplicativo. Aqui ficam os modelos que representam os dados manipulados, como usuários e registros de humor.
- **views/**: Diretório onde ficam as telas do aplicativo, como login, perfil, calendário de humor, entre outras. Cada tela é uma representação visual que interage com o usuário.
- **controllers/**: Contém a lógica de controle e interação entre os modelos e as views. Aqui ficam os responsáveis pela manipulação de dados, requisições à API e atualização da interface de acordo com as ações do usuário.
- **widgets/**: Componentes reutilizáveis da interface do usuário, como botões personalizados, campos de entrada e outros elementos visuais, para facilitar a reutilização de código.
- **services/**: Contém serviços responsáveis por interações externas, como chamadas de APIs, requisições HTTP, serviços de autenticação e qualquer outra lógica de negócio que envolva comunicação com fontes externas.
- **utils/**: Funções utilitárias e helpers, como funções de validação, manipulação de dados, conversões, e outras tarefas recorrentes usadas em várias partes do aplicativo.
- **assets/**: Arquivos estáticos como imagens, fontes, ícones e outros recursos usados no aplicativo.
- **themes/**: Contém arquivos relacionados ao tema e estilo do aplicativo, como cores, fontes e configurações personalizadas de tema.
- **providers/**: Quando aplicável, gerencia o estado global do aplicativo. Contém classes que lidam com o gerenciamento de estado usando pacotes como `provider`.
- **repositories/**: Centraliza a lógica de acesso aos dados, como integração com APIs ou bancos de dados locais, garantindo que as views não precisem se preocupar com a forma de obtenção e manipulação dos dados.


Essa organização segue os princípios do padrão MVC, o que torna o código mais modular, facilita a manutenção e torna o trabalho em equipe mais eficiente.



---

### 👩‍💻 Autores


<div align="center">
  Este projeto foi desenvolvido por:
  <br><br>
<table>
  <tr>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/01acde33-3dc8-4709-8cb1-7641980b7cb2" width="100px" height="100px" style="border-radius: 50%;" />
      <br />
      Jennyfer Alvim
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/12685e8b-9750-40e2-967e-195d0d0f59ef" width="100px" height="100px" style="border-radius: 50%;" />
      <br />
      Juan Pacheco
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/d3f792cb-a926-4d31-bcd7-6b2e5a769def" width="100px" height="100px" style="border-radius: 50%;" />
      <br />
      Stephanie Chini
    </td>
    <td align="center">
      <img src="https://github.com/user-attachments/assets/2567c146-1544-41a3-9366-9343c521fcfc" width="100px" height="100px" style="border-radius: 50%;" />
      <br />
      Thamiris Nishimori
    </td>
  </tr>
</table>
</div>

## 📜 Licença

Este projeto é de código aberto sob a licença [MIT]. Todos os direitos reservados.


O projeto está em constante desenvolvimento, e novas funcionalidades serão implementadas ao longo do tempo. Fique atento para atualizações!
