class MoneyController < ApplicationController
  # GET /money
  # GET /money.json
  def index
    @money = Money.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @money }
    end
  end

  # GET /money/1
  # GET /money/1.json
  def show
    @money = Money.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @money }
    end
  end

  # GET /money/new
  # GET /money/new.json
  def new
    @money = Money.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @money }
    end
  end

  # GET /money/1/edit
  def edit
    @money = Money.find(params[:id])
  end

  # POST /money
  # POST /money.json
  def create
    @money = Money.new(params[:money])

    respond_to do |format|
      if @money.save
        format.html { redirect_to @money, notice: 'Money was successfully created.' }
        format.json { render json: @money, status: :created, location: @money }
      else
        format.html { render action: "new" }
        format.json { render json: @money.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /money/1
  # PUT /money/1.json
  def update
    @money = Money.find(params[:id])

    respond_to do |format|
      if @money.update_attributes(params[:money])
        format.html { redirect_to @money, notice: 'Money was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @money.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money/1
  # DELETE /money/1.json
  def destroy
    @money = Money.find(params[:id])
    @money.destroy

    respond_to do |format|
      format.html { redirect_to money_index_url }
      format.json { head :no_content }
    end
  end
end
