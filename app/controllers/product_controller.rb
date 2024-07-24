require "openai"

class ProductController < ApplicationController
  before_action :set_product, only: [:update, :show, :intro_gpt]
  before_action :load_questions, only: [:intro_gpt]
  skip_before_action :authorize_request, except: [:update, :intro_gpt]
  # protect_from_forgery with: :null_session

  def set_product
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create
    if @product.save
      render json: @product, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def show
    if @product.present?
      render json: @product, status: :ok
    else
      render json: { errors: "id not found" }, status: :not_found
    end
  end

  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def available
    @product = Product.order(created_at: :desc).first
    @product = Product.create.save if @product.nil?
    render json: @product, status: :ok
  end

  def intro_params
    params.require(:product).permit(:name, :usage, :target_audience, :difference, :highlight, :style,
                                    :guidance, :competitor, :length, :extra)
  end

  def product_params
    params.require(:product).permit(:name, :intro)
  end

  def load_questions
    @questions ||= begin
      json_file_path = Rails.root.join("app", "assets", "jsons", "questions.json")
      file = File.read(json_file_path)
      JSON.parse(file)
    rescue StandardError => e
      raise "Error loading questions: #{e.message}"
    end
  end

  def intro_gpt
    return render json: @product.errors, status: :unprocessable_entity unless @product.update(intro_params)

    conversations = build_conversations(@questions, intro_params)

    begin
      result = Openai.get_intro(conversations)
      render json: { intro: result }, status: :ok
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def build_conversations(questions, intro_params)
    questions.map do |question|
      "Question: #{question['desc']}\nAnswer: #{intro_params[question['key']]}\n\n"
    end.join
  end
end
