<!--
    - This code needs to be refactored to reduce the amount of PHP in the Blade
    template as much as possible.

    - Need to check the view composer capability for the component.
-->
@php
    

    $customer = auth()->guard('customer')->user();
@endphp

<div class="panel-side grid grid-cols-[1fr] gap-8 max-w-[380px] max-h-[1320px] overflow-y-auto overflow-x-hidden journal-scroll min-w-[342px] max-xl:min-w-[270px] max-md:max-w-full">
    @if(auth()->guard('customer')->check())    
        <!-- Account Profile Hero Section -->
        <div class="grid grid-cols-[auto_1fr] gap-4 items-center px-5 py-[25px] border border-[#E9E9E9] rounded-xl">
            <div class="">
                <img
                    src="{{ $customer->image_url ??  bagisto_asset('images/user-placeholder.png') }}"
                    class="w-[60px] h-[60px] rounded-full"
                    alt="Profile Image"
                >
            </div>

            <div class="flex flex-col justify-between">
                <p class="text-2xl font-mediums">Hello! {{ $customer->first_name }}</p>

                <p class="text-[#6E6E6E] ">{{ $customer->email }}</p>
            </div>
        </div>
    @else
        <!-- Guest Profile -->
        <div class="grid grid-cols-[auto_1fr] gap-4 items-center px-5 py-[25px] border border-[#E9E9E9] rounded-xl">
            <div class="">
                <img
                    src="{{ bagisto_asset('images/user-placeholder.png') }}"
                    class="w-[60px] h-[60px] rounded-full"
                    alt="Profile Image"
                >
            </div>

            <div class="flex flex-col justify-between">
                <p class="text-2xl font-mediums">Hello, Guest!</p>
            </div>
        </div>
    @endif

    <!-- Account Navigation Menus -->
    @foreach (menu()->getItems('customer') as $menuItem)
        <div class="max-md:border max-md:border-t-0 max-md:border-r max-md:border-l-[1px] max-md:border-b max-md:border-[#E9E9E9]   max-md:rounded-md">
            <v-account-navigation>
                <!-- Account Navigation Toggler -->
                <div class="max-md:flex max-md:gap-x-4 max-md:justify-between max-md:items-center pb-5 max-md:bg-gray-100 max-md:px-6 max-md:py-5 max-md:rounded-tl-[6px] max-md:rounded-tr-[6px] accordian-toggle md:pointer-events-none select-none">
                    <p class="text-xl md:font-medium">{{ $menuItem->getName() }}</p>

                    <span class="icon-arrow-right text-2xl md:hidden"></span>
                </div>

                <!-- Account Navigation Content -->
                <div class="grid border border-t-0 border-r border-l-[1px] border-b border-[#E9E9E9] rounded-md max-md:hidden max-md:border-none accordian-content">
                @if ($menuItem->haveChildren())
                <div class="grid rounded-md border border-b border-l-[1px] border-r border-t-0 border-zinc-200 max-md:border-none">
                    @foreach ($menuItem->getChildren() as $subMenuItem)
                        <a href="{{ $subMenuItem->getUrl() }}">
                            <div class="flex justify-between px-6 py-5 border-t border-zinc-200 hover:bg-zinc-100 cursor-pointer max-md:p-4 max-md:border-0 max-md:py-3 max-md:px-0 {{ $subMenuItem->isActive() ? 'bg-zinc-100' : '' }}">
                                <p class="flex items-center gap-x-4 text-lg font-medium max-sm:text-base">
                                    <span class="{{ $subMenuItem->getIcon() }} text-2xl"></span>

                                    {{ $subMenuItem->getName() }}
                                </p>

                                <span class="icon-arrow-right rtl:icon-arrow-left text-2xl"></span>
                            </div>
                        </a>
                    @endforeach
                </div>
            @endif
                </div>
            </v-account-navigation>
        </div>
    @endforeach
</div>

@pushOnce('scripts')
    <script type="text/x-template" id="v-account-navigation-template">
        <div>
            <slot></slot>
        </div>
    </script>

    <script type="module">
        app.component("v-account-navigation", {
            template: '#v-account-navigation-template',

            data() {
                return {
                    isOpen: false,
                };
            },

            mounted() {
                this.$el.querySelector('.accordian-toggle').addEventListener('click', () => {
                    this.toggleAccordion();
                });
            },

            methods: {
                toggleAccordion() {
                    this.isOpen = ! this.isOpen;

                    if (this.isOpen) {
                        this.$el.querySelector('.icon-arrow-right').classList.add('icon-arrow-down');
                        this.$el.querySelector('.icon-arrow-down').classList.remove('icon-arrow-right');

                        this.$el.querySelector('.accordian-content').style.display = "grid";
                    } else {
                        this.$el.querySelector('.icon-arrow-down').classList.add('icon-arrow-right');
                        this.$el.querySelector('.icon-arrow-right').classList.remove('icon-arrow-down');

                        this.$el.querySelector('.accordian-content').style.display = "none";
                    }
                },
            },
        });
      </script>
@endpushOnce