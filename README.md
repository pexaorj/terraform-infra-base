
README


- Pendente de finalizar documentação, este repositorio é destinado a utilização do terraform no provedor AWS.
Maiores informações estão abaixo, no entanto em caso de dúvidas, peço que entre em contato.


##Docs##
- Repositorio para criar infraestrutura básica na AWS com duas zonas de disponibilidade (Zona A e Zona C)
- Utiliza um bucket com dois arquivos de state para separar a arquitetura basica de infraestrutura tais como:

>Arch-State
--VPC
--Subnets (DMZ e Banco)
--Rotas
--IGW
--Etc

>Deploy-State
--Subnets(apps)
--Instancias de aplicação



```
.
├── arch-state
│   ├── arch-main-state.tf
│   ├── makeconfig.sh
│   ├── modules
│   │   ├── eip
│   │   │   ├── eip.tf
│   │   │   ├── main.tf
│   │   │   └── output.tf
│   │   ├── env
│   │   │   ├── account-id.tf
│   │   │   ├── cidr-table.tf
│   │   │   └── main.tf
│   │   ├── instances
│   │   │   └── arch-instances
│   │   │       ├── instance_nat-a.tf
│   │   │       ├── instance_nat-c.tf
│   │   │       ├── main.tf
│   │   │       └── output.tf
│   │   ├── routes
│   │   │   ├── internet_gw.tf
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── routes_default_a.tf
│   │   │   ├── routes_default_c.tf
│   │   │   └── routes_dmz.tf
│   │   ├── security-group
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── securitygroup.tf
│   │   ├── subnets
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   ├── subnet-db.tf
│   │   │   └── subnet-dmz.tf
│   │   └── vpc
│   │       ├── dhcp-options.tf
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── vpc.tf
│   ├── output-export.tf
│   └── tfvars.tf
├── deploy-state
│   ├── deploy-main-state.tf
│   ├── makeconfig.sh
│   ├── modules
│   │   ├── instances
│   │   │   ├── app-instances
│   │   │   │   ├── app-a.tf
│   │   │   │   └── main.tf
│   │   │   └── db-instances
│   │   │       └── main.tf
│   │   └── subnets
│   │       ├── main.tf
│   │       ├── output.tf
│   │       └── subnet-app.tf
│   └── tfvars.tf
└── LICENSE

```
