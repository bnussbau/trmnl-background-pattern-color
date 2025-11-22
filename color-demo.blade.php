@props(['size' => 'full'])
<x-trmnl::view size="{{$size}}">

@php
    $colors = ['green', 'blue', 'orange', 'red', 'yellow'];
@endphp

<style>
@foreach($colors as $color)
.bg--{{ $color }}{
    background: repeat url(https://raw.githubusercontent.com/bnussbau/trmnl-background-pattern-color/refs/heads/main/output/{{ $color }}/{{ $color }}.png);
    image-rendering: pixelated;
    image-rendering: -moz-crisp-edges;
    image-rendering: crisp-edges;
}
@for($i = 1; $i <= 6; $i++)
.bg--{{ $color }}-{{ $i }}{
    background: repeat url(https://raw.githubusercontent.com/bnussbau/trmnl-background-pattern-color/refs/heads/main/output/{{ $color }}/{{ $color }}-{{ $i }}.png);
    image-rendering: pixelated;
    image-rendering: -moz-crisp-edges;
    image-rendering: crisp-edges;
}
@endfor
@endforeach
</style>
        

<div class="layout layout--col gap--space-between">
    @foreach($colors as $color)
    <div class="grid grid--cols-7 h-full py-16">
        <div class="flex flex--col flex--center-x">
            <div class="w--full h--full rounded flex-1 bg--{{ $color }}"></div>
            <span class="label label--small">{{ $color }}</span>
        </div>
        @for($i = 1; $i <= 6; $i++)
        <div class="flex flex--col flex--center-x">
            <div class="w--full h--full rounded flex-1 bg--{{ $color }}-{{ $i }}"></div>
            <span class="label label--small">{{ $i }}</span>
        </div>
        @endfor
    </div>
    @endforeach
</div>

<x-trmnl::title-bar/>
</x-trmnl::view>