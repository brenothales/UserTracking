require 'rails_helper'

describe Contato do
  it "has a valid factory" do
    expect(build(:contato)).to be_valid
  end

  it "is invalid without nome" do
    contato = build(:contato, nome: nil)
    contato.valid?
    expect(contato.errors[:nome]).to include("não pode ficar em branco")
  end

  it "is invalid without email" do
    contato = build(:contato, email: nil)
    contato.valid?
    expect(contato.errors[:email]).to include("não é válido")
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:contato, email: 'teste@icasei.com')
    contato = FactoryGirl.build(:contato, email: 'teste@icasei.com')
    contato.valid?
    expect(contato.errors[:email]).to include('já está em uso')
  end
end
