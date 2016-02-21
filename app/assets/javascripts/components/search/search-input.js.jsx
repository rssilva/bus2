BUS2.SearchInput = React.createClass({
  render: function () {
    return (
      <input type="text" placeholder={this.props.placeholder} className={this.props.className} id={this.props.id} />
    )
  }
});
