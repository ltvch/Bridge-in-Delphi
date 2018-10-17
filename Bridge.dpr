program Bridge;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  /// <summary> Implementor - реализатор </summary>
  /// <remarks>
  /// <li>
  /// <lu>определяет интерфейс для классов реализации. Он не обязан точно
  /// соотведствовать интерфейсу класса <see cref="Abstraction"/>. На самом деле оба
  /// интерфейса могут быть совершенно различны. Обычно интерфейс класса
  /// <see cref="Implementor"/> представляет только примитивные операции, а класс
  /// <see cref="Abstraction"/> определяет операции более высокого уровня,
  /// базирующиеся на этих примитивах;</lu>
  /// </li>
  /// </remarks>


  TImplementator = class abstract
    procedure Operation; virtual; abstract;
  end;

  /// <summary> Abstraction </summary>
  /// <remarks>
  /// <li>
  /// <lu> implement interface of abstraction определяем интерфейс абстракции;</lu>
  /// <lu> save link to object хранит ссылку на объект <see cref="Implementor"/></lu>
  /// </li>
  /// </remarks>
  TAbstraction = class
  strict private
    fImplementator: TImplementator;
    public
    property aImplementator: TImplementator read fImplementator write fImplementator;
    procedure Operation;virtual;
  end;

  /// <summary>
  /// RefinedAbstraction - implementation of abstraction
  /// </summary>
  /// <remarks>
  /// <li>
  /// <lu>расширяет интерфейс, определенный абстракцией <see cref="Abstraction"/></lu>
  /// </li>
  /// </remarks>
  /// <returns>True if the specified item is successfully removed;
  /// otherwise False is returned.
  /// </returns>
  TRefinedAbstraction = class(TAbstraction)
    procedure Operation;override;
  end;

  /// <summary>
  /// ConcreteImplementor - конкретный реализатор
  /// </summary>
  /// <remarks>
  /// <li>
  /// <lu> have a concrete implementation of interface содержит конкретную реализацию интерфейса <see cref="Implementor"/></lu>
  /// </li>
  /// </remarks>
  TConcreteImplementatorA = class(TImplementator)
    procedure Operation; override;
  end;

  TConcreteImplementatorB = class(TImplementator)
    procedure Operation; override;
  end;


{ TAbstraction }

procedure TAbstraction.Operation;
begin
  fImplementator.Operation;
end;

{ TRefinedAbstraction }

procedure TRefinedAbstraction.Operation;
begin
  aImplementator.Operation;
end;

{ TConcreteImplementatorA }

procedure TConcreteImplementatorA.Operation;
begin
  WriteLn(Self.ClassName + ' Operation');
end;

{ TConcreteImplementatorB }

procedure TConcreteImplementatorB.Operation;
begin
  WriteLn(Self.ClassName + ' Operation');
end;

var ab: TAbstraction;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    ab:= TRefinedAbstraction.Create;

    ab.aImplementator:= TConcreteImplementatorA.Create;
    ab.Operation;

    ab.aImplementator:= TConcreteImplementatorB.Create;
    ab.Operation;

    WriteLn(#13#10 + 'Press any key to continue...');
    ReadLn;

    ab.Free;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
