# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# WARNING: this is development only! should be removed when deploying.

# Clearing current objects.
=begin
Warehouse::delete_all
Server::delete_all
Camera::delete_all
User::delete_all

warehouse_id = Warehouse::create(label: 'IB Tecnologia').id
server_id = Server::create(label: 'AZMARGARIDA', address: '192.168.1.106', username: 'admin',
                           password: 'VIDEO!edge23', warehouse_id: warehouse_id).id
Camera::create(label: 'Camera-01', camera_id: 1, server_id: server_id)
Camera::create(label: 'Camera-02 [PTZ]', camera_id: 2, server_id: server_id)
User::create(username: 'admin', password: 'ibtech2012', password_confirmation: 'ibtech2012')
=end