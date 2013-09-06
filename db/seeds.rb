# Encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# WARNING: this is development only! should be removed when deploying.

# Clearing current objects.

Warehouse::delete_all
Server::delete_all
Camera::delete_all
User::delete_all

warehouse_id = Warehouse::create(label: 'Armazém Porto Seco').id

server_id = Server::create(label: 'SRV-ROCHA-SFS-01',
                           address: '177.0.200.3',
                           username: 'admin',
                           password: 'VIDEO!edge23',
                           warehouse_id: warehouse_id).id

['Gate 01 visualização de carga',
 'Gate 01 visualização da placa dianteira',
 'Gate 02 visualização de placa dianteira',
 'Gate 02 visualização de carga',
 'Gate 02 visualização de Nº',
 'Gate 02 visualização de placa traseira',
 'Gate 01 visualização de placa traseira',
 'Gate 01 visualização de Nº',
 'Perímetro inicio do Gate 01',
 'Visualização da entrada da balança 01',
 'Cerca próximo ao estacionamento da entrada do terminal',
 'Balança 01 visualização do Nº',
 'Balança 01 visualização da placa traseira',
 'Balança 01 visualização de carga',
 'Balança 01 visualização de placa dianteira',
 'Cerca próxima a saída da balança 01',
 'Visualização da saída da balança 01',
 'Cerca  prox. A Doca',
 'Cerca prox. A sub-estação',
 'Cerca prox. A sub-estação',
 'Cerca Prox. Ao reefers',
 'Cerca Prox. Ao reefers',
 'Cerca Prox. A rampa',
 'Cerca Prox. A rampa',
 'Cerca prox. A sub-estação',
 'Visualização do display de pesagem da balança 01',
 'Visualização do L. E. da doca',
 'Visualização do L. D. da doca',
 'Visualização da parte interna da doca',
 'Canto L.E. próximo a Doca',
 'Corredor L.E. Armazém 01',
 'Canto L.D. próximo a Doca',
 'Porta 06 L.D. AZ-01',
 'Porta 06 L.E. AZ-01',
 'Visualização interna Porta 06',
 'Corredor L.D. Meio D. AZ-01',
 'Porta 05 L.D. AZ-01',
 'Porta 05 L.E. AZ-01',
 'Visualização interna Porta 05',
 'Sala da Columbia',
 'Corredor em frente a sala da Columbia',
 'Corredor L.D Armazém 01',
 'Corredor L.E Armazém 01',
 'Corredor L.D. Fim D. AZ-01',
 'Porta 04 L.D. AZ-01',
 'Porta 04 L.E. AZ-01',
 'Visualização interna Porta 04',
 'Visualização Interna Porta 01',
 'Porta 01 L.D. AZ-01'].each_with_index do |c, i|
  Camera::create(label: c, camera_id: i+1, server_id: server_id)
end

server_id = Server::create(label: 'SRV-ROCHA-SFS-02',
                           address: '177.0.200.4',
                           username: 'admin',
                           password: 'VIDEO!edge23',
                           warehouse_id: warehouse_id).id

['Porta 01 L.E. AZ-01',
 'Porta 03 L.D. AZ-01',
 'Visualização próximo a área de entreposto aduaneiro',
 'Visualização interna porta 03',
 'Visualização interna porta 02',
 'Porta 02 L.E AZ-01',
 'Porta 02 L.D. AZ-01',
 'Visualização do Alpendre',
 'Porta 03 L.E. AZ-01',
 'Corredor próximo a sala dos operadores',
 'Porta de entrada para a sala do operacional',
 'Visão interna area de perdimentos AZ-01',
 'Visualização da cerca e estacionamento da Receita F. e Diretoria',
 'Portão da balança de saída (Gate 2)',
 'Visualização de carga balança de saída (Gate 2)',
 'Visualização de placa dianteira balança de saída (Gate 2)',
 'Cerca de divisão do estacionamento e balança de saída',
 'Visualização da cancela balança de saída (Gate 2)',
 'Saída Gate 02*',
 'Saída Gate 02*',
 'Visualização de Nº Balança de saída (Gate 2)',
 'Visualização de placa traseira (Gate 2)',
 'Pátio em  frente do CFS L.E. (porta de entrada)',
 'Cerca próximo ao antigo fubá',
 'Pátio em  frente do CFS L.D. (porta de entrada)',
 'Visualização interna do CFS',
 'Visualização interna do CFS',
 'Visualização externa Armazém 02 L.D.',
 'Sala de operação Armazém 02',
 'Visualização externa Armazém 02 Frente',
 'Visualização externa Armazém 02 Frente',
 'Visualização externa Armazém 02 L.E.',
 'Armazém 02 Visão interna L.E',
 'Armazém 02 Visão interna L.D',
 'Visualização externa Armazém 02 L.D.',
 'Armazém 02 Portão 20',
 'Armazém 02 Portão 01',
 'Armazém 02 Portão 02',
 'Armazém 02 Portão 03',
 'Visualização externa Armazém 02 L.E.',
 'Armazém 02 Portão 19',
 'Armazém 02 Portão 04',
 'Visualização externa Armazém 02 L.D.',
 'Armazém 02 Portão 18',
 'Armazém 02 Portão 05',
 'Visualização externa Armazém 02 L.E.',
 'Armazém 02 Portão 17',
 'Armazém 02 Portão 06',
 'Visualização externa Armazém 02 L.D.',
 'AZ-04 Porta da frente visão externa',
 'AZ-04 Porta da frente visão interna',
 'AZ-04 Box de 01 a 05',
 'AZ-04 Box de 06 a 10'].each_with_index do |c, i|
  Camera::create(label: c, camera_id: i+1, server_id: server_id)
end

server_id = Server::create(label: 'SRV-ROCHA-SFS-03',
                           address: '177.0.200.5',
                           username: 'admin',
                           password: 'VIDEO!edge23',
                           warehouse_id: warehouse_id).id

['Armazém 02 Portão 16',
 'Armazém 02 Visão interna L.D.',
 'Armazém 02 Visão interna L.D.',
 'Armazém 02 Visão interna L.E.',
 'Armazém 02 Visão interna L.E.',
 'Armazém 02 Portão 07',
 'Visualização externa Armazém 02 L.E.',
 'Armazém 02 Portão 08',
 'Armazém 02 Portão 15',
 'Visualização externa Armazém 02 L.D.',
 'Armazém 02 Portão 14',
 'Armazém 02 Portão 09',
 'Visualização externa Armazém 02 L.E.',
 'Armazém 02 Portão 13',
 'Armazém 02 Portão 12',
 'Armazém 02 Portão 11',
 'Armazém 02 Portão 10',
 'Visualização externa Armazém 02 L.D.',
 'Visualização externa Armazém 02 Fundos',
 'Armazém 02 Visão interna L.D.',
 'Armazém 02 Visão interna L.E.',
 'Visualização externa Armazém 02 L.E.',
 'Visualização externa Armazém 02 Fundos',
 'Speed Dome Patio 3 Fundos AZ-02',
 'Speed Dome Patio 2 Frente Oficina',
 'Speed Dome Patio 2 Perimetro',
 'Speed Dome Patio 2 Perimetro',
 'Speed Dome Patio 2 Perimetro',
 'Speed Dome Patio 3 AZ-02',
 'Speed Dome Patio 2 CFS',
 'Speed Dome Patio 3 / Patio 2',
 'Speed Dome Patio 3 / Gate 2',
 'Speed Dome Patio 1 Frente/Lateral',
 'Speed Dome Circulção Estacionamento',
 'Speed Dome Patio 1 Lateral/Fundos',
 'Visualização interna frente do Armazém 01',
 'Visualização interna frente do Armazém 01',
 'Speed Dome Patio 1 Fundos/Refeers',
 'Speed Dome Patio 1 Fundos/Rampa',
 'Visualização da catraca de acesso ao terminal',
 'Visualização do relógio ponto',
 'Cerca prox. A sub-estação',
 'Visualização do display de pesagem da balança 02',
 'Visualização da sala dos operadores',
 'Sala do CFTV',
 'Sala do CPD',
 'AZ-04 Porta dos fundos visão interna',
 'AZ-04 porta dos fundos visão externa'].each_with_index do |c, i|
  Camera::create(label: c, camera_id: i+1, server_id: server_id)
end

User::create(username: 'Administrador',
             password: 'ibtech',
             password_confirmation: 'ibtech')