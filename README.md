# Automação API do BFF
Projeto de automação de testes para as APIs do BFF

## Uso
Para executar algum cenário / suíte:
```sh
$ cucumber -t <TAG> -p <AMBIENTE> -p <BANDEIRA> -p <DISPOSITIVO>
```

**Parâmetros:**
* -e AMBIENTE="-p ???": ambiente onde serão executados os cenários, esse parâmetro é obrigatório e.
  * Exemplo: "-p prd"
* -e TAGS="-t @??? -t ...": tags dos cenários que quer executar, esse parâmetro é obrigatório.
  * Exemplo: "-p @bff_token.post"
* -e PROFILES="-p ??? -p ...": parâmetros para execução customizada, esse parâmetro é opcional e por padrão considera "-p default".
