# GitHub Profile App

Um aplicativo móvel construído com Flutter, projetado para realizar buscas utilizando a API do GitHub. Foi desenvolvido como parte do curso de Flutter da Especializa TI, com aprimoramentos e ajustes para se adequar à versão atual do Flutter.

## Sumário
  * [Requisitos](#requisitos)
  * [Funcionalidades](#funcionalidades)
  * [Demonstração](#demonstração)
  * [Como executar](#como-executar)

## Requisitos
- [Flutter](https://docs.flutter.dev/get-started/install) 3.10.6
- [Dart](https://dart.dev/get-dart#install) 3.0.6

## Funcionalidades

- [X] Buscar perfis de usuários do GitHub por nome de usuário.
- [X] Exibir detalhes do perfil encontrado, incluindo nome, avatar, número de seguidores e repositórios públicos.
- [X] Tratar possíveis erros durante a busca.

## Demonstração

<div align="center">
<table>
    <tr>
      <td><img src="https://github.com/thalis-freitas/github_profile/blob/f0de1d9f61afb62d13186a7fc2886df0966adb7e/assets/images/demo/home.png" alt="Home" /></td>
      <td><img src="https://github.com/thalis-freitas/github_profile/blob/f0de1d9f61afb62d13186a7fc2886df0966adb7e/assets/images/demo/search.png" alt="Search" /></td>
      <td><img src="https://github.com/thalis-freitas/github_profile/blob/f0de1d9f61afb62d13186a7fc2886df0966adb7e/assets/images/demo/results.png" alt="Results" /></td>
    </tr>
  </table>
</div>

## Como executar

1 - No terminal, clone o projeto:

```
git clone git@github.com:thalis-freitas/github_profile.git
```

2 - Entre na pasta do projeto:

```
cd github_profile
```

3 - Instale as dependências:

```
flutter pub get
```

4 - Conecte um dispositivo físico ou inicie um emulador Android ou iOS.

5 - Execute a aplicação:

```
flutter run
```
