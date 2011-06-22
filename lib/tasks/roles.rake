# encoding: UTF-8
namespace :SHARED_DATABASE do
  desc "Llenar la base de datos con los roles"
  
  task :populate => :environment do
    Role.create!(:name => "admin", :titulo => "Administrador")
    Role.create!(:name => "empleado", :titulo => "Empleado")
    Role.create!(:name => "jefe_departameto", :titulo => "Jefe de Departametno")
    Role.create!(:name => "gerente_general", :titulo => "Gerente General")
    Role.create!(:name => "gerente_area", :titulo => "Gerente de Área")
    Role.create!(:name => "gerente_rh", :titulo => "Gerente de Recursos Humanos")
  end
end