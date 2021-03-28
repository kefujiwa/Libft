/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/28 16:56:28 by kefujiwa          #+#    #+#             */
/*   Updated: 2021/03/28 17:02:16 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int		is_valid_base(char *base)
{
	char	*tmp;

	if (!base || !*base || !*(base + 1))
		return (0);
	while (*base)
	{
		if (*base == '-' || *base == '+' || ft_isspace(*base))
			return (0);
		tmp = base + 1;
		while (*tmp)
		{
			if (*base == *tmp)
				return (0);
			tmp++;
		}
		base++;
	}
	return (1);
}

static int		get_value(char c, char *base)
{
	char	*head;

	head = base;
	while (*base)
	{
		if (*base == c)
			return (base - head);
		base++;
	}
	return (-1);
}

int				ft_atoi_base(char *str, char *base)
{
	int	total;
	int	sign;
	int	val;

	total = 0;
	sign = 1;
	if (!is_valid_base(base))
		return (0);
	while (ft_isspace(*str))
		str++;
	while (*str == '-' || *str == '+')
	{
		if (*str == '-')
			sign *= -1;
		str++;
	}
	while ((val = get_value(*str, base)) >= 0)
	{
		total = total * ft_strlen(base) + val;
		str++;
	}
	return (total * sign);
}
