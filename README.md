Projeto de infraestrutura na AWS utilizando Terraform para provisionamento de uma VPC altamente disponível e segmentada em subnets públicas e privadas.

A arquitetura foi desenvolvida seguindo boas práticas de rede e segurança em Cloud Computing, incluindo:

- Criação de uma VPC customizada
- Configuração de subnets públicas e privadas
- Associação de tabelas de rotas específicas
- Acesso à internet nas subnets públicas através de Internet Gateway
- Saída controlada das subnets privadas utilizando NAT Gateway
- Separação de ambientes internos e externos visando maior segurança e organização da infraestrutura

O projeto foi desenvolvido utilizando Linux, Terraform e VS Code, com foco em automação de infraestrutura (Infrastructure as Code — IaC), escalabilidade e boas práticas de arquitetura na AWS.
