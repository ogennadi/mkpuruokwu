class EnglishEntriesController < ApplicationController
  # GET /english_entries
  # GET /english_entries.json
  def index
    @english_entries = EnglishEntry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @english_entries }
    end
  end

  # GET /english_entries/1
  # GET /english_entries/1.json
  def show
    @english_entry = EnglishEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @english_entry }
    end
  end

  # GET /english_entries/new
  # GET /english_entries/new.json
  def new
    @english_entry = EnglishEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @english_entry }
    end
  end

  # GET /english_entries/1/edit
  def edit
    @english_entry = EnglishEntry.find(params[:id])
  end

  # POST /english_entries
  # POST /english_entries.json
  def create
    @english_entry = EnglishEntry.new(params[:english_entry])

    respond_to do |format|
      if @english_entry.save
        format.html { redirect_to @english_entry, notice: 'English entry was successfully created.' }
        format.json { render json: @english_entry, status: :created, location: @english_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @english_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /english_entries/1
  # PUT /english_entries/1.json
  def update
    @english_entry = EnglishEntry.find(params[:id])

    respond_to do |format|
      if @english_entry.update_attributes(params[:english_entry])
        format.html { redirect_to @english_entry, notice: 'English entry was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @english_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /english_entries/1
  # DELETE /english_entries/1.json
  def destroy
    @english_entry = EnglishEntry.find(params[:id])
    @english_entry.destroy

    respond_to do |format|
      format.html { redirect_to english_entries_url }
      format.json { head :ok }
    end
  end
end
