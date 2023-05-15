@extends('admin.layouts.app')

@section('panel')
<!-- BEGIN: Content-->


<!-- Wishlist Starts -->
<section id="wishlist" class="grid-view wishlist-items">
  @forelse($gateways->sortBy('alias') as $k=>$gateway)
  <div class="card ecommerce-card">
    <div class="item-img text-center">
      <a href="#">
        <img src="{{ getImage(imagePath()['gateway']['path'].'/'. $gateway->image,imagePath()['gateway']['size'])}}" class="img-fluid" alt="img-placeholder" />
      </a>
    </div>
    <div class="card-body">
      <div class="item-wrapper">
        <div class="item-rating">

        </div>
        <div class="item-cost">
          <h6 class="item-price">
           @if($gateway->status == 1)
            <badge class="bg-success badge font-weight-normal badge-success">@lang('Active')</badge>
           @else
            <badge class="bg-danger badge font-weight-normal badge-warning">@lang('Disabled')</badge>
           @endif
          </h6>
        </div>
      </div>
      <div class="item-name">
        <a href="#">{{__($gateway->name)}} </a>
      </div>

    </div>
    <div class="item-options text-center">
     @if($gateway->status == 0)
     <form action="{{ route('admin.gateway.automatic.activate')}}" method="POST">
                    @csrf
                    <input value="{{$gateway->code}}" type="hidden" name="code">
      <button type="submit"  class="btn btn-success btn-wishlist remove-wishlist">
        <i data-feather="check"></i>
        <span>Activate</span>
      </button>
    </form>
    @else
     <form action="{{route('admin.gateway.automatic.deactivate')}}" method="POST">
                    @csrf
                    <input value="{{$gateway->code}}" type="hidden" name="code">
     <button type="submit"  class="btn btn-danger btn-block remove-wishlist">
        <i data-feather="x"></i>
        <span>Deactivate</span>
      </button>
    </form>
    @endif


      <a href="{{ route('admin.gateway.automatic.edit', $gateway->alias) }}" class="btn btn-primary btn-cart">
        <i data-feather="edit"></i>
        <span class="add-to-cart">Edit</span>
      </a>
    </div>
  </div>
  @empty
                                <tr>
                                    <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                </tr>
  @endforelse
</section>
<!-- Wishlist Ends -->

@endsection


