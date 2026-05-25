# 🌐 Arquitetura de Redes AWS: VPC e Segmentação Segura

Projeto de infraestrutura na AWS utilizando Terraform para o provisionamento de uma VPC altamente disponível e segmentada em subnets públicas e privadas. O foco é a automação da infraestrutura (Infrastructure as Code — IaC), escalabilidade e segurança.

## 🏗️ Topologia e Boas Práticas

A arquitetura foi desenvolvida seguindo as melhores práticas de rede em Cloud Computing, incluindo:

* **Isolamento de Rede:** Criação de uma VPC customizada com separação clara entre ambientes internos (privados) e externos (públicos).
* **Roteamento Estratégico:** Configuração e associação de tabelas de rotas específicas para cada tipo de subnet.
* **Acesso à Internet:** Liberação de tráfego de entrada/saída nas subnets públicas através de um **Internet Gateway**.
* **Saída Segura:** Configuração de saída controlada para a internet nas subnets privadas utilizando um **NAT Gateway**, garantindo que servidores internos baixem atualizações sem ficarem expostos.

## 🛠️ Stack Tecnológico
* **Orquestração:** Terraform (HCL)
* **Ambiente de Desenvolvimento:** Linux & VS Code
