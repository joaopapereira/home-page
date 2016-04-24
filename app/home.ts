@Component({
  // Declare the tag name in index.html to where the component attaches
  selector: 'home',
  // Location of the template for this component
  templateUrl: 'templates/home.html'
})

export class Home {
  // Declaring the variable for binding with initial value
  yourName: string = '';
}
