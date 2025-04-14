
<x-shop::layouts>

    <!-- Title of the page -->
    <x-slot:title>
        Package Blog
    </x-slot>

    <div class="main">
        Package Blog - @lang('blog::app.admin.name')
    </div>
    <!-- Shop Accordion -->
<x-shop::accordion 
    title="Shop Accordion" 
    class="last:border-b-0"
>
    <x-slot:header class="!py-2.5">
        Accordion Header
    </x-slot>

    <x-slot:content class="!p-0">
        Accordion Content
    </x-slot>
</x-shop::accordion>

<!-- Shop Drawer -->
<x-shop::drawer
    position="left"
    width="100%"
>
    <x-slot:toggle>
        Drawer Toggle
    </x-slot>

    <x-slot:header class="bg-red-100"> <!-- Pass your custom css to customize header -->
        Drawer Header
    </x-slot>

    <x-slot:content class="!p-5">
        Drawer Content
    </x-slot>
</x-shop::drawer>
<!-- Shop Date picker -->
<x-shop::flat-picker.date ::allow-input="false">
    <input
        type="date"
        name="date"
        class="mb-4"
        :allowInput="true"
        :disable="disabledDates"
        placeholder="date"
    />
</x-shop::flat-picker.date>


</x-shop::layouts>