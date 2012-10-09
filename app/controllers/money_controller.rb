class MoneyController < ApplicationController
  # GET /money
  # GET /money.json
  def list
    if signed_in?
        render 'list'
    else
      flash[:notice] = "Please sign in first."
      redirect_to controller: 'welcome', action: 'index'
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
    @money = current_user.money.build(params[:money])
 #   @money = Money.new(params[:money])

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

    redirect_to :controller => 'money', :action => 'list'
  end

  def search
    q = params[:query]

    if q
      all = current_user.money
      @search_results = Array.new
      if !all.empty?
        all.each do |m|
          if m[:description] =~ /^#{q}/i
            @search_results << m
          end
        end
      end
      render :partial => 'search', :layout => false, :locals => {:searchresults => @search_results}
    end
  end

end
