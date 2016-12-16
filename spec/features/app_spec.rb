require 'rails_helper'

feature 'User Navigating' do
  scenario "home and new contato record" do
    visit root_path
    expect(page).to have_content 'Home Rastreamento App'
    expect{
      click_link 'Contato'
      fill_in 'Nome', with: 'Contato A'
      fill_in 'Email', with: 'teste@icasei.com'
      click_button 'Criar Contato'
    }.to change(Contato, :count).by(1)
    expect(current_path).to eq new_contato_path
    expect(page).to have_content 'O contato foi criado com sucesso.'
  end
  scenario "sobre and relatório de rastreamento" do
    visit sobre_path
    expect(page).to have_content 'Sobre Rastreamento App'
    click_link 'Relatório de Rastreamento'
    expect(current_path).to eq rastreamentos_path
    expect(page).to have_content 'Lista os últimos 50 acessos rastreados'
  end
end
