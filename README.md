# Todo App

Bem vindo a nossa aplicação TODO APP!

Ela é uma simples app de tarefas. Ela é tão simples que se você quiser pode criar a sua igual eu fiz:
```shell
rails new todo-app --css tailwind
cd todo-app
rails generate scaffold Task title:string completed:date
```

Pronto! Foi apenas isso que eu fiz para ter essa aplicação. Esses comandos consideram que você tem o `Ruby 3.2.2` e o `Rails 7.0.7.2` instalados.

Você também pode rodar o projeto na raiz executando o comando: `bin/dev`. Esse comando considera que você tem o `Ruby 3.2.2` e o `Rails 7.0.7.2` instalados.

Não tem Ruby/Rails, mas tem docker? Tá fácil então, só rodar um: `docker-compose up`

Depois disso é só você acessar http://127.0.0.1:3000/tasks e sair usando.

Abaixo você tem alguns exercicios:
<details>
  <summary>Exercicio 1</summary>
O objetivo desse exercicio é configurar um log, uma métrica e um trace nessa aplicação.

Para isso, vamos usar o Datadog. Ele tem um teste de 14 dias, então não se preocupe.

Você pode ver detalhes de como fazer isso na [doc deles](https://docs.datadoghq.com/integrations/ruby/)
E se ficar com dúvida, pode abrir um PR ou uma issue que a gente troca ideia :) 

Objetivos:
- Adicionar uma regra de validação na Task para que o title seja obrigatório
- Adicionar um log debug quando a task for criada com sucesso
- Adicionar um log warn quando a task não for criada com sucesso
- Adicionar uma métrica indicando que a task não foi criada com sucesso com o nome `task.error`
- Configurar os logs para aparecerem no Datadog
- Configurar as métricas para aparecerem no Datadog
- Configurar o APM para exibir o serviço rodando no Datadog e mostrando as requests feitas localmente
</details>

<details>
  <summary>Exercicio 2</summary>

Agora a brincadeira é colocar a app em produção! 
Para isso vamos usar o [Render](render.com) que tem um di gratis que vai ajudar a gente.

Eles tem uma [doc](https://render.com/docs/deploy-rails) bem completa que você pode seguir, mas quando eu fiz só conectei o Github e mandei fazer deploy com Rails e funcionou.
(Mentira, eu tive que olhar no StackOverflow como fazer funcionar. [Aqui](https://stackoverflow.com/questions/23180650/how-to-solve-error-missing-secret-key-base-for-production-environment-rai))

Depois disso vamos colocar alguns alertas no Datadog e tentar disparar eles via email, para termos uma noção de como seria isso: 
- Alerta de numero de requests acima de 10 no último minuto
- Alerta de numero de requests abaixo de 1 no último minuto
- Alerta de error rate acima de 1% no último minuto

Importante! Essa app usa o SQLite3, que é um simples banco em arquivo. Então os dados podem ser perdidos a qualquer momento que o arquivo for deletado.
</details>