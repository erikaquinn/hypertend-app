class BloodPressuresController < ApplicationController

  def index
    @blood_pressures = BloodPressure.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    blood_pressure = BloodPressure.new(
      systolic_number: params[:systolic_number],
      diastolic_number: params[:diastolic_number],
      bpm: params[:bpm],
      weight: params[:weight],
      notes: params[:notes]
    )
    blood_pressure.save
    render "create.html.erb"
  end

  def show
    blood_pressure_id = params[:id]
    @blood_pressure = BloodPressure.find_by(id: blood_pressure_id)
    render "show.html.erb"
  end

  def edit
    blood_pressure_id = params[:id]
    @blood_pressure = BloodPressure.find_by(id: blood_pressure_id)
    render "edit.html.erb"
  end

  def update
    @blood_pressure = BloodPressure.find_by(id: params[:id])
    @blood_pressure.systolic_number = params[:systolic_number] || @blood_pressure.systolic_number
    @blood_pressure.diastolic_number = params[:diastolic_number] || @blood_pressure.diastolic_number
    @blood_pressure.bpm = params[:bpm] || @blood_pressure.bpm
    @blood_pressure.measurement_arm = params[:measurement_arm] || @blood_pressure.measurement_arm
    @blood_pressure.weight = params[:weight] || @blood_pressure.weight
    @blood_pressure.notes = params[:notes] || @blood_pressure.notes
    @blood_pressure.save
    render "update.html.erb"
  end

end
