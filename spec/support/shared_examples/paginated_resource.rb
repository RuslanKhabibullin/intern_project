shared_examples 'a paginated resource' do
  before do
    resource_creation
    visit path
  end

  describe 'Visit paginated page' do
    context 'first page' do
      it 'have "Next" link' do
        expect(page).to have_link('Next >')
      end

      it 'have "Last" link' do
        expect(page).to have_link('Last >>')
      end
    end

    context 'last page' do
      before { click_link('Last >>') }

      it 'have "Prev" link' do
        expect(page).to have_link('< Prev')
      end

      it 'have "First" link' do
        expect(page).to have_link('<< First')
      end
    end
  end
end
