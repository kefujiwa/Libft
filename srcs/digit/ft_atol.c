/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atol.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kefujiwa <kefujiwa@student.42tokyo.jp>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/28 16:23:01 by kefujiwa          #+#    #+#             */
/*   Updated: 2021/03/28 16:46:33 by kefujiwa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static long	calc_atol(const char *str, int sign)
{
	unsigned long	num;
	unsigned long	max;
	int				digit;

	num = 0;
	max = LONG_MAX;
	digit = (sign == 1 ? 7 : 8);
	while (ft_isdigit(*str))
	{
		if (num < max / 10 || (num == max / 10 && *str - '0' <= digit))
			num = num * 10 + (*str - '0');
		else
		{
			if (sign == 1)
				return (LONG_MAX);
			else
				return (LONG_MIN);
		}
		str++;
	}
	return ((long)num * sign);
}

long		ft_atol(const char *str)
{
	int	sign;

	sign = 1;
	while (ft_isspace(*str))
		str++;
	if (*str == '+' || *str == '-')
	{
		sign = (*str == '+' ? 1 : -1);
		str++;
	}
	return (calc_atol(str, sign));
}
