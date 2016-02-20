BUS2.Nav = React.createClass({
  componentDidMount: function() {
    BUS2.mainContainer.find('.bus2-header').toggleClass('select-menu');
    BUS2.mainContainer.find('.bus2-nav').toggleClass('on');      
  },

  render: function() {
    return (
      <div>
        MENU
      </div>
    )
  }
});