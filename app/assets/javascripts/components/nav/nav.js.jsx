BUS2.Nav = React.createClass({
  componentDidMount: function() {
    BUS2.mainContainer.find('.bus2-nav').addClass('on');      
  },

  componentWillUnmount: function() {
    BUS2.mainContainer.find('.bus2-nav').removeClass('on');      
  },

  render: function() {
    return (
      <div>
        MENU
      </div>
    )
  }
});