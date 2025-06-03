        <div class="model-id">
            <select name="model_id" class="form-control" id="model_id" required>
                @forelse($results as $data)
                <option value="{{$data->id}}">{{$data->name}}</option>
                @empty
                @endforelse
            </select>
        </div>