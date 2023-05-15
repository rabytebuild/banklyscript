@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
         <a href="javascript:void(0)" class="btn btn-sm btn--primary box--shadow1 text-white text--small addBtn"><i class="fa fa-fw fa-plus"></i>@lang('Add New')</a>
            <div class="card b-radius--10 ">
                <div class="card-body p-0">
                    <div class="table-responsive--md  table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                            <tr>
                                <th>@lang('Name')</th>
                                <th>@lang('Min-Max')</th>
                                <th>@lang('Duration')</th>
                                <th>@lang('Interest')</th>
                                <th>@lang('Penalty')</th>
                                <th>@lang('Status')</th>
                                <th>@lang('Action')</th>
                            </tr>
                            </thead>
                            <tbody>
                            @forelse($plan as $data)
                            <tr>
                                <td data-label="@lang('Name')">
                                    <span class="font-weight-bold">
                                        {{ __($data->name) }}
                                    </span>
                                </td>

                                <td data-label="@lang('Limit')">
                                    <span class="font-weight-bold" data-toggle="tooltip" data-original-title="@lang('Limitation of Amount')">
                                        {{ $general->cur_sym }} {{ showAmount($data->min) }} -
                                        {{ $general->cur_sym }} {{ showAmount($data->max) }}
                                    </span>
                                </td>

                                <td data-label="@lang('Total Return')">
                                    {{ $data->duration }} @lang('Months')
                                </td>

                                <td data-label="@lang('Interest Type')">
                                   {{ $data->fee }}%
                                </td>
                                <td data-label="@lang('Interest Type')">
                                   {{ $data->penalty }}%
                                </td>

                                <td data-label="@lang('Status')">
                                    @if($data->status == 0)
                                        <span class="badge bg-danger">
                                            @lang('Disabled')
                                        </span>
                                    @else
                                        <span class="badge bg-success">
                                            @lang('Enabled')
                                        </span>
                                    @endif
                                </td>

                                <td data-label="@lang('Action')">
                                    <a href="#0"

                                    data-id='{{ $data->id }}'
                                    data-name='{{ $data->name }}'
                                    data-status='{{ $data->status }}'
                                    data-min='{{ getAmount($data->min) }}'
                                    data-max='{{ getAmount($data->max) }}'
                                    data-duration='{{ $data->duration }}'
                                    data-interest='{{ $data->fee }}'
                                    data-penalty='{{$data->penalty }}'

                                    class="btn btn-sm btn--primary text-white icon-btn editBtn"
                                    data-toggle="tooltip"
                                    title="@lang('Edit')"
                                    data-original-title="@lang('Edit')"
                                    >
                                        Edit
                                    </a>
                                </td>
                            </tr>
                            @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                </tr>
                            @endforelse

                            </tbody>
                        </table><!-- table end -->
                    </div>
                </div>
                <div class="card-footer py-4">
                    {{ paginateLinks($plan) }}
                </div>
            </div>
        </div>

    </div>

{{-- ADD METHOD MODAL --}}
<div id="addModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Add New Loan Plan')</h5>

            </div>
            <form action="{{ route('admin.loan.create') }}" method="POST">
                @csrf

                <div class="modal-body">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="name">@lang('Name')</label>
                                <input type="text" name="name" class="form-control" id="name" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group  mb-1">
                                <label for="min_amount">@lang('Minimum Amount')</label>
                                <div class="input-group">
                                    <input type="text" name="min" onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')" id="min" class="form-control" required>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-1">
                                <label for="max_amount">@lang('Maximum Amount')</label>
                                <div class="input-group">
                                    <input type="text" name="max" onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')" id="max" class="form-control" required>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="total_return">@lang('Loan Duration')  <small>(Months)</small></label>
                                <div class="input-group">
                                    <input type="number" id="total_return" class="form-control" name="duration" required>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="interest_type">@lang('Loan Penalty')  <span>%</span></label>
                                <div class="input-group">
                                    <input type="number" id="total_return" class="form-control" name="penalty" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="interest">@lang('Interest Amount') <span id="change_interest_symbol">%</span></label>
                                <div class="input-group">
                                    <input type="text" onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')" name="interest" id="interest" class="form-control" required>

                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="status">@lang('Status')</label>
                                <select name="status" id="status" class="form-control" required>
                                    <option value="1">@lang('Enable')</option>
                                    <option value="0">@lang('Disable')</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">@lang('Close')</button>
                    <button type="submit" class="btn btn--primary text-white">@lang('Save')</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- EDIT METHOD MODAL --}}
<div id="editModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">@lang('Edit Loan Plan')</h5>

            </div>
            <form action="{{ route('admin.loan.edit') }}" method="POST">
                @csrf

                <input type="hidden" name="id" required>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="edit_name">@lang('Name')</label>
                                <input type="text" name="name" class="form-control" id="edit_name" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="edit_min_amount">@lang('Minimum Amount')</label>
                                <div class="input-group mb-1">
                                    <input type="text" name="min" onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')" id="min" class="form-control" required>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-1">
                                <label for="edit_max_amount">@lang('Maximum Amount')</label>
                                <div class="input-group">
                                    <input type="text" name="max" onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')" id="max" class="form-control" required>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="edit_total_return">@lang('Duration') <small>(Months)</small></label>
                                <div class="input-group">
                                    <input type="number" id="duration" class="form-control" name="duration" required>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="edit_interest_type">@lang('Penalty') %</label>
                                <div class="input-group">
                                    <input type="number" id="penalty" class="form-control" name="penalty" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="edit_interest">@lang('Interest Amount') <span id="update_interest_symbol">%</span></label>
                                <div class="input-group">
                                    <input type="text" onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')" name="interest" id="edit_interest" class="form-control" required>

                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="form-group mb-1">
                                <label for="edit_status">@lang('Status')</label>
                                <select name="status" id="edit_status" class="form-control" required>
                                    <option value="1">@lang('Enable')</option>
                                    <option value="0">@lang('Disable')</option>
                                </select>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">@lang('Close')</button>
                    <button type="submit" class="btn text-white btn--primary">@lang('Update')</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection


@push('script')
<script>
    (function ($) {

        "use strict";

        $('.addBtn').on('click', (e)=> {
            var modal = $('#addModal');
            modal.modal('show');
        });

        $('#interest_type').on('change', (e)=>{
            var $this = e.currentTarget;

            var result = null;

            if($this.value == 0){
                result = '{{ __($general->cur_text) }}';
            }else{
                result = '%';
            }

            $('#change_interest_symbol').text(result);

        });

        $('#edit_interest_type').on('change', (e)=>{
            var $this = e.currentTarget;

            var result = null;

            if($this.value == 0){
                result = '{{ __($general->cur_text) }}';
            }else{
                result = '%';
            }

            $('#update_interest_symbol').text(result);

        });

        $('.editBtn').on('click', (e)=> {
            var $this = $(e.currentTarget);
            var modal = $('#editModal');

            var result = null;

            if($this.data('interest_type') == 0){
                result = '{{ __($general->cur_text) }}';
            }else{
                result = '%';
            }

            $('#update_interest_symbol').text(result);

            modal.find('input[name=id]').val($this.data('id'));
            modal.find('input[name=name]').val($this.data('name'));
            modal.find('input[name=duration]').val($this.data('duration'));
            modal.find('input[name=max]').val($this.data('max'));
            modal.find('input[name=min]').val($this.data('min'));
            modal.find('input[name=interest]').val($this.data('interest'));
            modal.find('input[name=status]').val($this.data('status'));
            modal.find('input[name=penalty]').val($this.data('penalty'));
            modal.modal('show');
        });

    })(jQuery);

</script>
@endpush
