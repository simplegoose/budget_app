require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/entities', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Entity. As you add validations to Entity, be sure to
  # adjust the attributes here as well.
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:valid_attributes) do
    {
      name: 'string',
      amount: 0
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      amount: nil
    }
  end

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_category_entity_path(category)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Entity' do
        expect do
          post category_entities_path(category), params: { entity: valid_attributes }
        end.to change(Entity, :count).by(1)
      end

      it 'redirects to the created entity' do
        post category_entities_path(category), params: { entity: valid_attributes }
        expect(response).to redirect_to(category_path(category))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Entity' do
        expect do
          post category_entities_path(category), params: { entity: invalid_attributes }
        end.to change(Entity, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post category_entities_path(category), params: { entity: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
