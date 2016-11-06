#!/bin/bash  
# Alunos: Fernando Bueno Dansi

while : ; do

configname() {
		name=$( dialog --stdout --inputbox "Digite o nome da Maquina:" 0 0)

			hostname $name

		dialog --stdout --infobox "O Nome $name Foi Configurado" 0 0
		sleep 2
}

mostrarname() {

		dialog --prgbox "hostname" 50 100

}

rede_tempora() {
		placa=$( dialog --stdout --inputbox "Digite o nome da Placa de Rede" 0 0)
		ip=$( dialog --stdout --inputbox "Digite o ip Desejado" 0 0)
		netmask=$( dialog --stdout --inputbox "Digite a Mascara Desejada" 0 0)

			ifconfig $placa $ip netmask $netmask

		dialog --stdout --infobox "Rede Temporia Configurada" 0 0
		sleep 2
}

Visu_Config_rede() {

		dialog --stdout --prgbox "ifconfig" 50 100
		sleep 5
}

Cria_Rota_Padrao() {
		ip=$( dialog --stdout --inputbox "Digite o IP para Rota PadrÃ£o" 0 0)

			route add default gw $ip

		dialog --stdout --infobox "Rota PadrÃ£o Configurada" 0 0
		sleep 2

}

Cria_Rota_Qualquer() {

		ip=$( dialog --stdout --inputbox "Digite o IP para Rota" 0 0)
		mask=$( dialog --stdout --inputbox "Digite a Mascara da Rede" 0 0)
		ip2=$( dialog --stdout --inputbox "Digite o EndereÃ§o do Roteador" 0 0)

			route add -net $ip mask $mask gw $ip2

		dialog --stdout --infobox "Rota Configurada" 0 0
		sleep 2

}

Ver_Rotas() {

		dialog --stdout --prgbox "route" 50 100

}

Remo_Rota_Padrao() {

		route del default

		dialog --stdout --infobox "Rota Padrao Removida" 0 0

}


Remo_Rota_Qualquer() {

		ip=$( dialog --stdout --inputbox "Digite o IP para Rota" 0 0)
		mask=$( dialog --stdout --inputbox "Digite a Mascara da Rede" 0 0)
		ip2=$( dialog --stdout --inputbox "Digite o EndereÃ§o do Roteador" 0 0)

			route del -net $ip mask $mask gw $ip2

		dialog --stdout --infobox "Rota Removida" 0 0
		sleep 2

}

Desativar_interface_rede() {

		interface=$( dialog --stdout --inputbox "Digite a Interface Que Deseja Desativar:" 0 0)

			ifconfig $interface  down

		dialog --stdout --infobox "A Interface Foi Desativada" 0 0

		sleep 2

}

Ativar_interface_rede() {

		interface=$( dialog --stdout --inputbox "Digite o Nome Da Interface Que Deseja Ativar:" 0 0)

			ifconfig $interface up

		dialog --stdout --infobox "A Interface Foi Ativada" 0 0

		sleep 2

}

renovar_emprestimo_ip() {

		renovar=$( dialog --stdout --inputbox "Digite o Nome Da Interface Que Deseja Renovar:" 0 0)

			dhclient $renovar

		dialog --stdout --infobox "O Emprestivo e IP Foi Renovado" 0 0
		sleep 2

}

Liberar_config_interface() {

		liberar=$( dialog --stdout --inputbox "Digite o Nome Da Interface Que Deseja Liberar o IP Emprestada a Interface:" 0 0)

			dhclient -r $liberar

		dialog --stdout --infobox "A Configuração Foi Liberada" 0 0
		sleep 2

}

exibir_conexao_tpc() {

		dialog --stdout --prgbox "ifconfig" 50 100

		sleep 2

}




resolver_nome_ip() {

		nome1=$( dialog --stdout --inputbox "digite o nome que deseja saber o endereço ip" 0 0)

			dialog --stdout --prgbox "nslookup $nome1" 50 100

		sleep 2

}

gravar_endereco_dns() {

		dialog --infobox "Teste"

}

exibe_tabela_arp() {

		dialog --stdout --prgbox "arp -a" 50 100
		sleep 2

}
criar_tabela_arp(){

		endip=$( dialog --stdout --inputbox "Digite o IP Para Criar Uma Entrada Estatica" 0 0)
		endmac=$( dialog --stdout --inputbox "Digite o Endereço MAC Para Entrada Estatica" 0 0)

			arp -s $endip $endmac

		sleep 2

}
remover_tabela_arp(){

		endip=$( dialog --stdout --inputbox "Digite o IP Para Remover Uma Entrada Estatica" 0 0)

			arp -d $endip

		sleep 2
}

Saindo(){

		dialog --stdout --infobox "Saindo!!!\nObrigado Por Utilizar!!!\n" 0 0
			sleep 2
		break;

}

#sair() { Usuario=$( dialog --stdout --infobox "Saindo" 0 0)
#exit
#}

opcao=$( dialog --stdout --menu "############# Gerenciador de Redes - Fernando Bueno ##########" 0 0 0 \
		1 'Configurar Hostname'\
		2 'Mostrar Hostname'\
		3 'Criar Rede Temporaria'\
		4 'Visualizar Rede Temporaria'\
		5 'Criar Rota Padrao'\
		6 'Criar Rota Qualquer'\
		7 'Visualizar Rotas'\
		8 'Remover Roda Padrao'\
		9 'Remover Rota Qualquer'\
		10 'Desativar Interface Solicitada'\
		11 'Ativar Interface Solicitada'\
		12 'Renovar Emprestivo De Endereço IP Junto ao DHCP Para Interface Solicitada'\
		13 'Liberar Configuracoes De IP'\
		14 'Exibir Conexoes TCP'\
		15 'Resolver o Nome Em Um Endereço IP'\
		16 'Gravar Endereço Do Servidor DNS No Arquivo De Configuracao'\
		17 'Exibir Tabela ARP'\
		18 'Criar Uma Entrada Estatica Na Tabela ARP Do Computador'\
		19 'Remover Uma Entrada Estatica Na Tabela ARP'\
		20 'Sair Do Gerenciador' )

case $opcao in
	1) configname ;;
	2) mostrarname ;;
	3) rede_tempora ;;
	4) Visu_Config_rede ;;
	5) Cria_Rota_Padrao ;;
	6) Cria_Rota_Qualquer ;;
	7) Ver_Rotas ;;
	8) Remo_Rota_Padrao ;;
	9) Remo_Rota_Qualquer ;;
	10) Desativar_interface_rede ;;
	11) Ativar_interface_rede ;;
	12) renovar_emprestimo_ip ;;
	13) Liberar_config_interface ;;
	14) exibir_conexao_tpc ;;
	15) resolver_nome_ip ;;
	16) gravar_endereco_dns ;;
	17) exibe_tabela_arp ;;
	18) criar_tabela_arp ;;
	19) remove_tabela_arp ;;
	20) Saindo ;;
	*) dialog --infobox 'Opcao Invalida' 0 0;;
esac

done
