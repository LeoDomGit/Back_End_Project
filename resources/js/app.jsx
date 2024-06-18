import React from 'react';
import { createRoot } from 'react-dom/client'; 
import { createInertiaApp } from '@inertiajs/inertia-react';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import { ProSidebarProvider } from 'react-pro-sidebar'; 

createInertiaApp({
  resolve: (name) => resolvePageComponent(`./Pages/${name}.jsx`, import.meta.glob('./Pages/**/*.jsx')),
  setup({ el, App, props }) {
    createRoot(el).render(
      <React.StrictMode>
        <ProSidebarProvider>
          <App {...props} />
        </ProSidebarProvider>
      </React.StrictMode>
    ); 
  },
});
