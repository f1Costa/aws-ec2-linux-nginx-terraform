# Provisionamento de uma Instância EC2 com Nginx usando Terraform

Este projeto usa Terraform para provisionar uma instância Amazon EC2 executando Amazon Linux 2 na região Leste dos EUA (N. Virgínia) (`us-east-1`). A instância é do tipo `t3.micro` e vem com o servidor Nginx instalado.

## Visão Geral

- **Provedor:** AWS
- **Região:** us-east-1
- **Tipo de Instância:** t3.micro
- **AMI:** Amazon Linux 2
- **Servidor Web:** Nginx

## Componentes

### 1. Grupo de Segurança

- **Nome:** `terraform-instance-sg`
- **Regras de Entrada:**
  - **HTTP (Porta 80):** Permite tráfego de qualquer endereço IP (`0.0.0.0/0`)
  - **SSH (Porta 22):** Permite tráfego de qualquer endereço IP (`0.0.0.0/0`)
- **Regras de Saída:**
  - Permite todo tráfego de saída.

### 2. Instância EC2

- **AMI ID:** `ami-0c02fb55956c7d316` (Amazon Linux 2 para us-east-1)
- **Tipo de Instância:** `t3.micro`
- **Grupo de Segurança:** Associado ao grupo de segurança `terraform-instance-sg`.
- **User Data:** 
  - Atualiza a instância.
  - Instala o Nginx usando Amazon Linux Extras.
  - Inicia e habilita o serviço Nginx.


