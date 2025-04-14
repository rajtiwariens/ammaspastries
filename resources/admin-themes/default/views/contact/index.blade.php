<x-admin::layouts>
    <x-slot:title>
        @lang('admin::app.contacts.index.title')
    </x-slot>
    <div class="flex items-center justify-between gap-4 max-sm:flex-wrap">
        <p class="text-xl font-bold text-gray-800 dark:text-white">
            @lang('admin::app.contacts.index.title')
        </p>

        <div class="flex items-center gap-x-2.5">
            <!-- Export Modal -->
            <x-admin::datagrid.export :src="route('admin.contact.index')" />
        </div>
    </div>
    

    
    <!-- Datagrid -->
    <x-admin::datagrid
        :src="route('admin.contact.index')"
        :isMultiRow="true"
    >
        
    </x-admin::datagrid>

    @pushOnce('scripts')
        
    @endPushOnce
</x-admin::layouts>
