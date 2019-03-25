include ApiCommons

module REST
  def departamento
    Bff::Rest::Departamentos.new
  end

  def banners
    Bff::Rest::Banners.new
  end

  def auth
    Bff::Rest::Auth.new
  end

  def captcha
    Bff::Rest::Captcha.new
  end

  def carrinho
    Bff::Rest::Carrinho.new
  end

  def produto
    Bff::Rest::Produto.new
  end

  def quantidade
    Bff::Rest::Quantidade.new
  end
end
