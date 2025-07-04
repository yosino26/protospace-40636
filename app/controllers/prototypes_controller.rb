class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # ここに create の処理を書きます
  end
end
