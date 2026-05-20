# 1. Criação da VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-desafio"
  }
}

# 2. Criação das Subnets Públicas
resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true # Isto torna a subnet pública de verdade

  tags = {
    Name = "subnet-public-1a"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "subnet-public-1b"
  }
}

# 3. Criação das Subnets privadas:

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "subnet-private-1a"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "subnet-private-1b"
  }
}

# 1. Criar o Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-desafio"
  }
}

# 2. Criar a Tabela de Roteamento Pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" # Representa toda a internet externa
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt-public"
  }
}

# 3. Associar a Tabela de Roteamento às Subnets Públicas
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

# 1. Criar o Security Group para o Servidor
resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Permitir SSH local"
  vpc_id      = aws_vpc.main.id

  # Regra de Entrada: SSH
  ingress {
    description = "SSH de qualquer lugar"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  # Regra de Saída: Liberar a máquina para atualizar pacotes
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-web-desafio"
  }
}

# 2. Criar a Instância EC2
resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # ID oficial do Ubuntu 22.04 LTS na regiao us-east-1
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_1.id

  # Vincula o Security Group a esta instancia
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "ec2-web-desafio"
  }
}
