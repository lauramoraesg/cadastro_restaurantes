import { RestaurantesintPage } from './app.po';

describe('restaurantesint App', () => {
  let page: RestaurantesintPage;

  beforeEach(() => {
    page = new RestaurantesintPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
