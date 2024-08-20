import { registerApplication, start, LifeCycles } from 'single-spa';

registerApplication({
  name: '@two-end/app-dashboard',
  app: () => System.import<LifeCycles>('@two-end/app-dashboard'),
  activeWhen: ['/dashboard'],
});

// registerApplication({
//   name: '@two-end/app-planning-poker',
//   app: () => System.import<LifeCycles>('@two-end/app-planning-poker'),
//   activeWhen: ['/planning-poker'],
// });

start({
  urlRerouteOnly: false,
});
