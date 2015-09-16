require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(nombre: "Carlos", apellido: "Martinez", correo: "user@example.com", password: "123456", password_confirmation: "123456")
  end
  
  test "debe ser valido" do
    assert @user.valid?
  end
  
  test "nombre debe tener un valor" do
    @user.nombre = "     "
    assert_not @user.valid?
  end
  
  test "apellido debe tener un valor" do
    @user.apellido = "     "
    assert_not @user.valid?
  end
  
  test "correo debe tener un valor" do
    @user.correo = "     "
    assert_not @user.valid?
  end
  
  test "nombre no debe ser muy largo" do
    @user.nombre = "a" * 51
    assert_not @user.valid?
  end
  
  test "apellido no debe ser muy largo" do
    @user.nombre = "a" * 51
    assert_not @user.valid?
  end

  test "correo no debe ser muy largo" do
    @user.correo = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "correo debe aceptar direcciones de correo validas" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.correo = valid_address
      assert @user.valid?, "#{valid_address.inspect} debe ser valido"
    end
  end

  test "correo de rechazar direcciones de correo invalidas" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.correo = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} deben ser invalidas"
    end
  end

  test "los correos deben ser unicos" do
    duplicate_user = @user.dup
    duplicate_user.correo = @user.correo.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password debe existir (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password debe tener un minimo de caracteres" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
