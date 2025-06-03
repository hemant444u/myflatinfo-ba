    <div class="model-id">
        <div class="form-group">
            <label for="name" class="col-form-label">Building Facility:</label>
            <select name="model_id" class="form-control" id="model_id" required>
                @forelse($building_facilities as $b_facility)
                <option value="{{$b_facility->id}}">{{$b_facility->facility->name}}</option>
                @empty
                @endforelse
            </select>
        </div>
    </div>