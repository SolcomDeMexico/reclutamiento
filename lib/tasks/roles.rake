# encoding: UTF-8
namespace :SHARED_DATABASE do
  desc "Llenar la base de datos con los roles"
  
  task :populate => :environment do
    Role.create!(:nombre => "admin", :titulo => "Administrador")
    Role.create!(:nombre => "empleado", :titulo => "Empleado")
    Role.create!(:nombre  => "jefe_departameto", :titulo => "Jefe de Departametno")
    Role.create!(:nombre => "gerente_general", :titulo => "Gerente General")
    Role.create!(:nombre => "gerente_area", :titulo => "Gerente de Área")
    Role.create!(:nombre => "gerente_rh", :titulo => "Gerente de Recursos Humanos")
  end
end