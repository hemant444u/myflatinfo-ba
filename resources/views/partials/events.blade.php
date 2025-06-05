    <div class="model-id">
        <div class="form-group">
            <label for="name" class="col-form-label">Events:</label>
            <select name="model_id" class="form-control" id="model_id" required>
                @forelse($events as $event)
                <option value="{{$event->id}}" {{ request('model_id') == $event->id ? 'selected' : ''}}>{{$event->name}}</option>
                @empty
                @endforelse
            </select>
        </div>
    </div>