BUS2.SearchInput = React.createClass({


  render: function () {
    return (
      <input
        autoComplete="off"
        type="text"
        placeholder={this.props.placeholder}
        className={this.props.className} 
        id={this.props.id} 
        name={this.props.name}
        value={this.props.value}
        onKeyUp={this.props.onKeyUp} />
    )
  }
});
