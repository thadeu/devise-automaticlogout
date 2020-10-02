# Devise Automatic Logout

By Thadeu Esteves Jr.

Provê um logout automático da sessão numa aplicação Rails utilizando Devise. É simples e fácil.
Faz com que a sessão seja destruída após a conclusão do tempo estipulado. É de grande ajuda em sistemas que necessitam de sessão auto destrutiva, evitando de o usuário ficar logado por muito tempo de forma ociosa.

## O que isso faz?

* Força o usuário a sair da sessão (logout)
* Opção de mostrar um timer regressivo
* Opção de dar um alerta na tela ao ser deslogado

## Começando

Adicione ao seu Gemfile

```ruby
gem 'devise-automaticlogout', '~> 1.0'
```

Rode o `bundle install`

## Configure o controller

No controller que você deseja aplicar o timer para o devise, use:

```ruby
devise_automatic_logout
```

Por exemplo, para o comum ApplicationController, poderia ser

```ruby
class ApplicationController < ActionController::Base
  devise_automatic_logout
end
```

Isso por si só, já prepara a aplicação para ler os dados do `Devise#timeout_in`, utilizando o scope padrão `user` e uma mensagem padrão de alerta.

Mas se você quiser, configurar um tempo diferente do timeout_in do devise? Fácil, use o seguinte:

```ruby
devise_automatic_logout time: 1.hour.to_i
```

Isso vai aplicar 1 hora para o logout automático. 

Mas e se você quiser colocar outra mensagem? Fácil, use o seguinte:

```ruby
devise_automatic_logout time: 1.hour.to_i, message: 'SUA MENSAGEM'
```

Mas e se você quiser fazer, com que seja utilizado outro tipo de mapping do devise? Fácil, use o seguinte:

```ruby
devise_automatic_logout scope: 'member'
```

É possível também utilizar todos de uma vez só, por exemplo

```ruby
devise_automatic_logout time: 15.minutes.to_i, message: 'Sua sessão expirou! Faça login novamente.', scope: 'member'
```

__OBS: Quando o `time` não é passado, o timeout_in do devise será aplicado, se configurado, é claro!__

## Configurando Timeoutable

Veja na documentação do próprio devise como fazer isso.

[Configurar o tempo](https://github.com/plataformatec/devise#configuring-models)

[Mais informações sobre Timeoutable](http://www.rubydoc.info/github/plataformatec/devise/master/Devise/Models/Timeoutable)

## Configurando o timer regressivo (OBRIGATÓRIO)

Esse helper deve ser usado em qualquer view, ele é importante, pois tudo será baseado nele

```ruby
<%= regressive_timer visible: true, alert: true %>
```

* visible: mostra um timer regressivo
* alert: lança um `window.alert` se ativado, ao final do timer

## Configurando Javascript

Adicione no seu application.js, o seguinte:

```javascript
//= require automatic_logout
```

Se você usa vanilla js, adicionar também o seguinte:

```javascript
//= require automatic_logout/classic
```

Se você usa jQuery, use:

```javascript
//= require automatic_logout/jquery
```

Se você usa Turbolinks mais atual, use:

```javascript
//= require automatic_logout/turbolinks
```

Se você usa Turbolinks mais antigo, use:

```javascript
//= require automatic_logout/turbolinks-classic
```

Se preferir, use manualmente em algum momento desejado

```javascript
AutomaticLogout.load();
```

## Contributing

We have a long list of valued contributors. Check them all at: https://github.com/Thadeu/devise-automaticlogout.
